require './app'
require './data'
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
  apl=App.new
  loop do
    case menu
    when 1
      puts "hello"
    when 2
      puts "hello"
    when 3
      apl.listgame
    when 4
      puts "hello"
    when 5
      puts "hello"
    when 6
      apl.list_authors
    when 7
      puts "hello"
    when 9
      apl.add_game
    when 10
      puts "thank you for using our app"
      exit
    else
      puts 'Invalid option selected'
    end
  end
end

def main
  Main.New
end