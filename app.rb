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
      puts 'welcome to our catalog

      1 - list all books
      2  - List all music albums
      3 - List of games
      4 - List all genres
      5 - List all labels
      6 - List all authors
      7 - Add a book
      8 - Add a music album
      9 - Add a game
      10 - exit'
      

    action = gets.chomp.to_i
    if action < 10 && action.positive?
      select(action)
    elsif action == 10
      puts 'Bye!'
    else
      menu
    end
  end

  def select(action)
    case action
    when 1
      list_all_books

    when 5
      list_all_labels

    when 7
      add_a_book
    end
  end

  def add_a_book
    puts "\nPublisher\n"
    publisher = gets.chomp
    puts "\nCover state\n"
    cover = gets.chomp
    puts "\nPublish date dd/mm/yy \n"
    date = gets.chomp
    book = Book.new(publisher, cover, date)
    @books << book
    puts "\nWould you like to add a label? (1) - YES // (2)
    - NO\n"
    option = gets.chomp.to_i
    if option == 1
      puts "\nChoose a title for the label\n"
      label_title = gets.chomp
      puts "\nChoose a color for the label\n"
      label_color = gets.chomp
      label = Label.new(label_title, label_color)
      @labels << label
    end
    save_all_labels_books
  end

  def save_all_labels_books
    bjson = []
    @books.each do |book|
      bjson.push({ publisher: book.publisher, cover_state:
    book.cover_state, publish_date: book.publish_date })
    end
    bookson = JSON.generate(bjson)
    File.write('books.json', bookson)
    ljson = []
    @labels.each do |label|
      ljson.push({ title: label.title, color: label.color })
    end
    labson = JSON.generate(ljson)
    File.write('labels.json', labson)
    self.menu
  end

  def list_books_stored
    if File.exist?('books.json') && !File.zero?('books.json')
      bookfile = File.open('books.json')
      bookjson = bookfile.read
      JSON.parse(bookjson).map do |book|
        booksjson = Book.new(book['publisher'],
                             book['cover_state'],
                             book['publish_date'])
        @books << booksjson
      end
      bookfile.close
    else
      File.new('books.json', 'w')
    end
  end

  def list_all_books
    if @books.empty?
      puts "\nThere are no books available\n"
    else
      @books.each do |book|
        puts "\nPublisher #{book.publisher} Cover #
{book.cover_state} published #{book.publish_date}\n"
      end
    end
    self.menu
  end

  def list_all_labels
    if @labels.empty?
      puts "\nThere are no labels available"
    else
      @labels.each do |label|
        puts "\nLabel name #
{label.title} of color #{label.color}\n"
      end
    end
    self.menu
  end

  def list_labels_stored
    if File.exist?('labels.json') && !File.zero?('labels.json')
      labelsfile = File.open('labels.json')
      labeljson = labelsfile.read
      JSON.parse(labeljson).map do |label|
        labeljson = Label.new(label['title'], label['color'])
        @labels << labeljson
      end
      labelsfile.close
    else
      File.new('labels.json', 'w')
    end
  end
end
