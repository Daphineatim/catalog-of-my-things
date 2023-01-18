require_relative './action_handler'

class Main
  def self.menu
    puts " welcome to our catalog"
    puts "\n"
    puts "Input the index to execute one of the options"

    @list={
      1=>'list all books',
      2=> 'List all music albums',
      3=> 'List all movies',
      4=> 'List of games',
      5=> 'List all genres (e.g "Comedy", "Thriller")',
      6=> 'List all labels (e.g. "Gift", "New")',
      7=>'List all authors (e.g. "Stephen King")',
      8=>'List all sources (e.g. "From a friend", "Online shop")',
      9=>'Add a book',
      10=>'Add a music album',
      11=>'Add a movie',
      12=>'Add a game',
      13=>'exit',
    }
    puts "\n"
    @list.each do  |index, item|
      puts "#{index}, #{item}" 
    end
    Integer(gets.chomp)
  end

  a=ActionHandler.new

  loop do
    case menu
    when 1
      puts "hello"
    when 2
      puts "hello2"
    when 3
      puts "hello2"
    when 4
      puts "hello2"
    when 5
      puts "hello2"
    when 6
      puts "hello2"
    when 7
      a.list_authors
    when 9
      puts "hello2"
    when 10
      puts "hello2"
    when 11
      puts "hello2"
    when 12
      a.add_game
    when 13
      exit
    end
  end
end

def main
  Main.New
end
