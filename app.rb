require 'date'
require_relative './music_album'
require_relative './genre'
require_relative './data'
class App
  def initialize
    @music_albums = []
  end

  def list_music_albums
    load_music_album
  end

  def listgenres
    load_genre
  end

  def add_musicalbum
    puts 'Enter the genre:'
    genre = gets.chomp
    puts 'Enter the author:'
    author = gets.chomp
    puts 'Enter the source:'
    source = gets.chomp
    puts 'Enter the label:'
    label = gets.chomp
    puts 'Enter the publish date according to this format: dd/mm/yyy'
    publish_date = gets.chomp.to_s
    puts 'Is it on Spotify? (true/false)'
    on_spotify = gets.chomp

    @music_albums.push(MusicAlbum.new(genre, author, source, label, publish_date, on_spotify))
    save_music_album(genre, author, source, label, publish_date, on_spotify)
    puts 'Successfully music album added'
  end
end
