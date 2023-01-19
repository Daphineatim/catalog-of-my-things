require_relative 'data'
require 'date'

class App
  def initialize
    @games = []
    @authors = []
  end

  def list_all_books
    list_books
  end

  def add_game
    puts "\n Publish date Format: dd/mm/yyyy \n"
    publish_date = gets.chomp
    puts "\nPlease enter the last played date of the game dd/mm/yyyy\n"
    last_played_at = gets.chomp
    puts "\n Please enter the multiplayer status of the game (true/false) \n"
    multiplayer = gets.chomp
    game = Game.new(publish_date, last_played_at, multiplayer)
    @games.push(game)
    save_game(publish_date, last_played_at, multiplayer)
    puts "\nWould you like to add the author? press 1 to proceed any other key to exit\n"
    option = gets.chomp.to_i
    return unless option == 1

    puts "\nEnter author first name\n"
    first_name = gets.chomp
    puts "\nEnter author last name\n"
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors.push(author)
    save_author(first_name, last_name)
  end

  def listgame
    load_game
  end

  def list_authors
    load_authors
  end

  def list_all_labels
    load_label
  end
end
