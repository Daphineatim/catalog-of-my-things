require_relative 'book'
require_relative 'label'
require_relative './data'
require 'date'
require_relative './music_album'
require_relative './genre'
class App
  def initialize
    @music_albums = []
    @genre = []
    @books = []
    @games = []
    @labels = []
    @authors = []
  end

  def add_a_book
    puts "\nPublisher\n"
    publisher = gets.chomp
    puts "\nCover state\n"
    cover = gets.chomp
    puts "\nPublish date Format: dd/mm/yyyy\n"
    date = gets.chomp
    book = Book.new(publisher, cover, date)
    @books.push(book)
    add_book(publisher, cover, date)
    puts "\nWould you like to add a label? press 1 to proceed any other key to exit\n"
    option = gets.chomp.to_i
    return unless option == 1

    puts "\nChoose a title for the label\n"
    label_title = gets.chomp
    puts "\nChoose a color for the label\n"
    label_color = gets.chomp
    label = Label.new(label_title, label_color)
    @labels.push(label)
    save_label(label_title, label_color)
  end

  def list_all_books
    list_books
  end

  def list_all_labels
    load_label
  end

  def list_music_albums
    load_music_album
  end

  def listgenres
    load_genre
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
