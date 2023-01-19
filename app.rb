require_relative 'book'
require_relative 'label'
require_relative './data'

class App
  def initialize
    @books = []
    @albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end

  # def add_a_book
  #   puts "\nPublisher\n"
  #   publisher = gets.chomp
  #   puts "\nCover state\n"
  #   cover = gets.chomp
  #   puts "\nPublish date Format: dd/mm/yyyy\n"
  #   date = gets.chomp
  #   book = Book.new(publisher, cover, date)
  #   @books.push(book)
  #   add_book(publisher, cover, date)
  #   puts "\nWould you like to add a label? press 1 to proceed any other key to exit\n"
  #   option = gets.chomp.to_i
  #   return unless option == 1

  #   puts "\nChoose a title for the label\n"
  #   label_title = gets.chomp
  #   puts "\nChoose a color for the label\n"
  #   label_color = gets.chomp
  #   label = Label.new(label_title, label_color)
  #   @labels.push(label)
  # end

  # def list_all_books
  #   list_books
  # end

  # def list_all_labels
  #   if @labels.empty?
  #     puts "\nThere are no labels available"
  #   else
  #     @labels.each { |label| puts "Label name #{label.title} of color #{label.color}" }
  #   end
end
# end
