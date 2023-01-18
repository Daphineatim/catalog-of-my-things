require_relative 'music_album'
require 'json'

def save_music_album(genre, author, source, label, publish_date, on_spotify) # rubocop:disable Metrics/ParameterLists
  obj = {
    genre: genre,
    author: author,
    source: source,
    label: label,
    publish_date: publish_date,
    on_spotify: on_spotify
  }

  return unless File.exist?('./json/music_album.json')

  open_file = File.open('./json/music_album.json')
  if open_file.empty?
    music_album = [obj]
  else
    music_album = JSON.parse(File.read('./json/music_album.json'))
    music_album << obj
  end
  open_file.close

  write_music_album = File.open('./json/music_album.json', 'w')
  write_music_album.write(JSON.generate(music_album))
  write_music_album.close
end

def load_music_album() # rubocop:disable Metrics/MethodLength
  if File.exist?('./json/music_album.json')
    open_album = File.open('./json/music_album.json')
    if open_album.empty?
      puts 'no music albums'
    else
      read_album = JSON.parse(File.read('./json/music_album.json'))
      read_album.each do |music_albums|
        music_albums = MusicAlbum.new(music_albums['genre'], music_albums['author'], music_albums['source'],
                                      music_albums['label'], music_albums['publish_date'], music_albums['on_spotify'])
        @music_albums << music_albums
      end
    end
    open_album.close
  else
    puts 'create a music album record'
  end
  puts 'Music albums'
  @music_albums.map do |album|
    puts "\n Genre :\"#{album.genre}\"\n author: \"#{album.author}\"
        \n Source: \"#{album.source}\" \n label: \"#{album.label}
      \n Publish date: \"#{album.publish_date}\" \n On Spotify: \"#{album.on_spotify}"
  end
end
