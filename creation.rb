require_relative './game.rb'
require 'json'

def add_game_json(genre, author, source, label, publish_date,last_played_at,multiplayer, archived:false)
 obj={ 
  'multiplayer' => @multiplayer,
  'last_played_at' => @last_played_at,
  'publish_date' => @publish_date,
  'archived' => @archived
  }
 if File.exist?('storage_files/saved_games.json') 
  opened_file=File.open('storage_files/saved_games.json')
  if opened_file.size.zero?
   games=[obj]
  else
   games=JSON.parse(opened_file.read)
   games << obj
  end
  opened_file.close
  f=File.open('storage_files/saved_games.json', 'w')
  f.write(JSON.generate(games))
  f.close
end
end