# Preserve data in JSON objects
require_relative 'game'
require_relative 'author'
require 'json'

module GamesHandler
  def save_data(_games, _authors)
    File.write('storage_files/saved_games.json', JSON.generate(@games))
    File.write('storage_files/saved_authors.json', JSON.generate(@authors))
  end

  def load_games
    saved_games = JSON.parse(File.read('storage_files/saved_games.json'))
    saved_games.each do |game|
      new_game = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'], game['archived'])
      @games << new_game
    end
  end

  def load_authors
    saved_authors = JSON.parse(File.read('storage_files/saved_authors.json'))
    saved_authors.each do |author|
      new_author = Author.new(author['first_name'], author['last_name'])
      @authors << new_author
    end
  end
end
