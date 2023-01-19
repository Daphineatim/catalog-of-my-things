require_relative 'app'

class Main
  def start
    puts "
      1 - list all books
      2 - List all music albums
      3 - List of games
      4 - List all genres
      5 - List all labels
      6 - List all authors
      7 - Add a book
      8 - Add a music album
      9 - Add a game
      10 - exit'
          "

    action = gets.chomp.to_i
    if action < 10 && action.positive?
      starting(action)
    elsif action == 10
      puts 'Thanks for visiting our app'
    else
      start
    end
  end

  def starting(action)
    app = App.new
    case action
    when 1
      app.list_all_books

    when 5
      app.list_all_labels

    when 7
      app.add_a_book

    end
  end
end

Main.new.start
