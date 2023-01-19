require_relative './game.rb'
require_relative './author.rb'
require 'json'

def add_game_json(publish_date, last_played_at, multiplayer)
  newonj={
      publish_date: publish_date,
      multiplayer: multiplayer, 
      last_played_at: last_played_at
     }
 if File.exist?('storage_files/saved_games.json') 
  opened_file=File.open('storage_files/saved_games.json')
  if opened_file.size.zero?
   games=[newonj]
  else
   games=JSON.parse(opened_file.read)
   games << newonj
  end
  opened_file.close
  f=File.open('storage_files/saved_games.json', 'w')
  f.write(JSON.pretty_generate(games))
  f.close
end
end

def add_author_json(first_name, last_name)
  saved_authors = []
  if File.exist?('storage_files/saved_authors.json')
    saved_authors = JSON.parse(File.read('storage_files/saved_authors.json'))
  end
  new_author = { 'first_name' => first_name, 'last_name' => last_name }
  saved_authors << new_author
  File.write('storage_files/saved_authors.json', saved_authors.to_json)
end
  