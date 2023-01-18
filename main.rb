require_relative './app'
class Main
  def self.menu
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
    @list.each do |index, item|
      puts "#{index}, #{item}"
    end
    Integer(gets.chomp)
  end
  newapp=App.new
  loop do
    case menu
    when 1
      newapp.list_all_books
    when 2
      puts 'Option 2 selected'
    when 3
      puts 'Option 3 selected'
    when 4
      puts 'Option 4 selected'
    when 5
      newapp.list_all_labels
    when 6
      puts 'Option 6 selected'
    when 7
      newapp.add_a_book
    when 9
      puts 'Option 9 selected'
    when 10
      puts 'Thank you for using our app goodbye'
      exit
    else
      puts 'Invalid option selected'
    end
  end
end

def main
  Main.New
end
