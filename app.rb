require 'date'
require_relative './music_album'
require_relative './genre'
require_relative './data'
class App
  def initialize
    @music_albums = []
    @genre = []
  end

  def list_music_albums
    load_music_album
  end

  def listgenres
    load_genre
  end

  def add_musicalbum # rubocop:disable Metrics/MethodLength:
    puts 'Is the album on spotify [Y/N]'
    on_spotify = gets.chomp.downcase
    puts 'Enter the published date format dd/mm/yyyy:'
    publish_date = gets.chomp.to_s
    puts 'Enter the author:'
    @music_albums.push(MusicAlbum.new(publish_date, on_spotify))
    save_music_album(publish_date, on_spotify)
    puts 'would you love to save the genre press y to continue or no'
    response = gets.chomp
    case response
    when 'y'
      puts 'Enter genre such as comedy, thriller'
      name = gets.chomp
      @genre.push(Genre.new(name))
      save_genre(name)
    when 'n'
      puts 'thank you'
    else
      puts 'invalid option'
    end
    puts 'Successfully music album added'
  end
end
