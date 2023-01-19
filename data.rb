require_relative 'game'
require_relative 'author'
require 'json'

def save_author(first_name, last_name)
  obj = {
    first_name: first_name,
    last_name: last_name
  }

  return unless File.exist?('./json/saved_authors.json')

  open_file = File.open('./json/saved_authors.json')

  if open_file.size.zero? # rubocop:disable Style/ZeroLengthPredicate
    author = [obj]
  else
    author = JSON.parse(File.read('./json/saved_authors.json'))
    author << obj
  end
  open_file.close

  write_author = File.open('./json/saved_authors.json', 'w')
  write_author.write(JSON.generate(author))
  write_author.close
end

def save_game(publish_date, last_played_at, multiplayer)
  obj = {
    publish_date: publish_date,
    last_played_at: last_played_at,
    multiplayer: multiplayer
  }

  return unless File.exist?('./json/saved_games.json')

  open_file = File.open('./json/saved_games.json')

  if open_file.size.zero? # rubocop:disable Style/ZeroLengthPredicate
    game = [obj]
  else
    game = JSON.parse(File.read('./json/saved_games.json'))
    game << obj
  end
  open_file.close

  write_game = File.open('./json/saved_games.json', 'w')
  write_game.write(JSON.generate(game))
  write_game.close
end

def save_label(title, color)
  obj = {
    title: title,
    color: color
  }

  return unless File.exist?('./json/label.json')

  open_file = File.open('./json/label.json')

  if open_file.size.zero? # rubocop:disable Style/ZeroLengthPredicate
    label = [obj]
  else
    label = JSON.parse(File.read('./json/label.json'))
    label << obj
  end
  open_file.close

  labels = File.open('./json/label.json', 'w')
  labels.write(JSON.generate(label))
  labels.close
end

def load_label()
  if File.exist?('./json/label.json')
    open_label = File.open('./json/label.json')
    if open_label.size.zero? # rubocop:disable Style/ZeroLengthPredicate
      puts 'no labels'
    else
      read_label = JSON.parse(File.read('./json/label.json'))
      read_label.each do |label|
        label = MusicAlbum.new(label['title'], label['color'])
        @labels << label
      end
    end
    open_label.close
  else
    puts 'create a label'
  end
  puts 'Labels'
  @labels.map do |label|
    puts "\n Label title: \"#{label.title}\" \n Label color: \"#{label.color}"
  end
end

def load_authors()
  if File.exist?('./json/saved_authors.json')
    open_author = File.open('./json/saved_authors.json')
    if open_author.size.zero? # rubocop:disable Style/ZeroLengthPredicate
      puts 'no authors'
    else
      read_author = JSON.parse(File.read('./json/saved_authors.json'))
      read_author.each do |autho|
        autho = Author.new(autho['first_name'], autho['last_name'])
        @authors << autho
      end
    end
    open_author.close
  else
    puts 'create authors'
  end
  puts 'Authors'
  @authors.map do |autho|
    puts "\n Publish date: \"#{autho.first_name}\" \n On Spotify: \"#{autho.last_name}"
  end
end

def load_game() # rubocop:disable Metrics/MethodLength
  if File.exist?('./json/saved_games.json')
    open_game = File.open('./json/saved_games.json')
    if open_game.size.zero? # rubocop:disable Style/ZeroLengthPredicate
      puts 'no games'
    else
      read_game = JSON.parse(File.read('./json/saved_games.json'))
      read_game.each do |game|
        game = Game.new(game['publish_date'], game['last_played_at'], game['multiplayer'])
        @games << game
      end
    end
    open_game.close
  else
    puts 'create a game'
  end
  puts 'Games'
  @games.map do |album|
    puts "\n Publish date: \"#{album.publish_date}\" \n
    last played at: \"#{album.last_played_at}\"\n
    multiplayer: \"#{album.multiplayer}"
  end
end
