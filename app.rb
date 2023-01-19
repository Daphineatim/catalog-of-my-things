require 'json'
require_relative './books/list_items'
require_relative './books/create_book'
require_relative './modules/save_books'
require_relative './modules/load_books'
require_relative './books/label'

class App
  attr_accessor :books, :labels

  include SaveBookData
  include LoadBookData
  def initialize
    @books = load_books
    @labels = load_labels
    @list_items = ListItems.new
  end

  def start
    loop do
      puts ' welcome to our catalog'
      puts "\n"
      puts 'Input the index to execute one of the options'

      @list = {
        1 => 'list all books',
        2 => 'List all music albums',
        3 => 'List of games',
        4 => 'List all genres (e.g "Comedy", "Thriller")',
        5 => 'List all labels (e.g. "Gift", "New")',
        6 => 'List all authors (e.g. "Stephen King")',
        7 => 'Add a book',
        8 => 'Add a music album',
        9 => 'Add a game',
        10 => 'exit'
      }
      puts "\n"
      input = gets.chomp
      options(input)
    end
  end

  def options(input)
    case input
    when '1', '5', '7', '10'
      handle_book(input)
    when '2'
      puts 'list all music albums'
    when '3'
      puts 'List all games'
    when '4'
      puts 'List all genres'
    when '6'
      puts 'List all authors'
    when '8'
      puts 'Add a music album'
    when '9'
      puts 'Add a game'
    else
      puts 'Invalid option'
    end
  end
  
  def handle_book(input)
    case input
    when '1'
      @list_items.show_books_list(@books)
    when '5'
      @list_items.show_labels_list(@labels)
    when '7'
      @books << CreateBook.new.create_book
    when '10'
      save_data(@books)
      puts 'exit'
      exit
    end
  end
end
