require 'json'
require_relative './books/list_items'
require_relative './books/create_book'
require_relative './modules/save_books'
require_relative './modules/load_books'
require_relative './books/label'

class Main
  include SaveBookData
  include LoadBookData
  def initialize
    @books = load_books
    @labels = load_labels
    @list_items = ListItems.new

    menu
  end

  def menu
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
    loop_method
  end

  def loop_method
    loop do
      input = obtain_input
      case input
      when 1, 5, 7, 10
        handle_books(input)
      when 2
        puts 'Option 2 selected'
      when 3
        puts 'Option 3 selected'
      when 4
        puts 'Option 4 selected'
      when 6
        puts 'Option 6 selected'
      when 9
        puts 'Option 9 selected'
      else
        puts 'Invalid option selected'
      end
    end
  end

  def obtain_input
    puts "\n"
    @list.each { |index, item| puts "#{index}, #{item}" }
    Integer(gets.chomp)
  end

  def handle_books(input)
    case input
    when 1
      @list_items.show_books_list(@books)
    when 5
      @list_items.show_labels_list(@labels)
    when 7
      @books << CreateBook.new.create_book
    when 10
      save_data(@books)
      puts 'Thank you for using our app goodbye'
      exit
    end
  end
end

def main
  Main.new
end
main
