require_relative 'music_album'
require_relative 'genre'
require 'json'

def save_music_album(publish_date, on_spotify)
  obj = {
    publish_date: publish_date,
    on_spotify: on_spotify
  }

  return unless File.exist?('./json/music_album.json')

  open_file = File.open('./json/music_album.json')

  if open_file.size.zero? # rubocop:disable Style/ZeroLengthPredicate
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

def save_genre(name)
  obj = {
    genre: name
  }

  return unless File.exist?('./json/genre.json')

  open_file = File.open('./json/genre.json')

  if open_file.size.zero? # rubocop:disable Style/ZeroLengthPredicate
    genre = [obj]
  else
    genre = JSON.parse(File.read('./json/genre.json'))
    genre << obj
  end
  open_file.close

  write_genre = File.open('./json/genre.json', 'w')
  write_genre.write(JSON.generate(genre))
  write_genre.close
end

def load_music_album()
  if File.exist?('./json/music_album.json')
    open_album = File.open('./json/music_album.json')
    if open_album.size.zero? # rubocop:disable Style/ZeroLengthPredicate
      puts 'no music genres'
    else
      read_album = JSON.parse(File.read('./json/music_album.json'))
      read_album.each do |music_albums|
        music_albums = MusicAlbum.new(music_albums['publish_date'], music_albums['on_spotify'])
        @music_albums << music_albums
      end
    end
    open_album.close
  else
    puts 'create a music album record'
  end
  puts 'Genres'
  @music_albums.map do |album|
    puts "\n Publish date: \"#{album.publish_date}\" \n On Spotify: \"#{album.on_spotify}"
  end
end

def load_genre()
  @genre = []
  if File.exist?('./json/genre.json')
    open_genre = File.open('./json/genre.json')
    if open_genre.size.zero? # rubocop:disable Style/ZeroLengthPredicate
      puts 'no music albums'
    else
      read_genre = JSON.parse(File.read('./json/genre.json'))

      read_genre.each do |name|
        name = Genre.new(name['genre'])
        @genre << name
      end
    end
    open_genre.close
  else
    puts 'create a music album record'
  end
  puts 'Music albums'
  @genre.each { |gen| puts "Here are the genres:\n#{gen}" }
end
require_relative './book'
def add_book(publisher, cover_state, publish_date)
  newobj = {
    publisher: publisher,
    cover_state: cover_state,
    publish_date: publish_date
  }
  return unless File.exist?('./json/book.json')

  newbook = File.open('./json/book.json')
  if newbook.size.zero? # rubocop:disable Style/ZeroLengthPredicate
    book = [newobj]
  else
    book = JSON.parse(File.read('./json/book.json'))
    book << newobj
  end
  write_book = File.open('./json/book.json', 'w')
  write_book.write(JSON.generate(book))
  write_book.close
end

def list_books # rubocop:disable Metrics/MethodLength:
  if File.exist?('./json/book.json')
    newbook = File.open('./json/book.json')
    if newbook.size.zero? # rubocop:disable Style/ZeroLengthPredicate
      puts 'create a new book'
    else
      books = JSON.parse(File.read('./json/book.json'))
      books.each do |book|
        book = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
        @books << book
      end
    end
  else
    puts 'create book records'
  end

  puts 'Books are:'
  puts "\n"
  @books.each do |book|
    puts "Publisher: #{book.publisher}"
    puts "Cover state: #{book.cover_state}"
    puts "Published on: #{book.publish_date}"
    puts "\n\n"
  end
end
