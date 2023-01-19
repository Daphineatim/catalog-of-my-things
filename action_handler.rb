require_relative 'author'
require_relative 'game'
require_relative 'creation'
require_relative 'preserve'
require 'json'

class ActionHandler
  include GamesHandler

  def initialize
    @authors = load_authors
    @games = load_games

  end

 def list_games
    if @games.empty?
      puts 'There are no games on the list'
    else
      # Check wheter the game instance is multiplayer or not
      @games.each do |game|
        if game.multiplayer == 'true'
          puts "Game is multiplayer and was last played at #{game.last_played_at}"
        else
          puts "Game is not multiplayer and was last played at #{game.last_played_at}"
        end
      end
    end
  end

   def list_authors
    if File.empty?('storage_files/saved_authors.json')
      puts 'There are no authors on the list'
    else
      saved_authors = JSON.parse(File.read('storage_files/saved_authors.json'))
      saved_authors.each do |author|
        new_author = Author.new(author['first_name'], author['last_name'])
        @authors << new_author
      end
    end
    puts "Authors are:"
    @authors.each do |author|
      puts "#{author.first_name} #{author.last_name}"
    end
  end

  def add_game
    puts 'Please enter the multiplayer status of the game (true/false)'
    multiplayer = gets.chomp
    puts 'Please enter the last played date of the game (YYYY-MM-DD)'
    last_played_at = gets.chomp
    puts 'Please enter the publish date of the game (YYYY-MM-DD)'
    publish_date = gets.chomp
    puts 'Please enter the archived status of the game (true/false)'
    archived = gets.chomp

    new_game = Game.new(publish_date,last_played_at,multiplayer)
    @games << new_game
    add_game_json(publish_date, last_played_at, multiplayer)

    puts 'Do you want to add the author of the game? (y/n)'
    answer = gets.chomp
    if answer == 'y'
      puts 'Please enter the first name of the author'
      first_name = gets.chomp
      puts 'Please enter the last name of the author'
      last_name = gets.chomp
      new_author = Author.new(first_name, last_name)
      @authors << new_author
      add_author_json(first_name, last_name)
      puts 'Author was added to the list'      
    els if answer == 'n'
      puts 'Thank you for adding the game to the list'
    else
      puts 'Please enter a valid answer?'
    end
    puts 'Game was added to the list'   
  end
end
