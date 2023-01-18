require_relative './book'
require 'json'
def add_book(publisher, cover_state, publish_date)
  newobj={
    publisher:publisher, 
    cover_state:cover_state, 
    publish_date:publish_date
  }
  return unless File.exists?("./json/book.json")
    newbook=File.open("./json/book.json")
    if newbook.size.zero?
      book=[newobj]
    else
      book=JSON.parse(File.read("./json/book.json"))
      book << newobj
    end
    write_book=File.open("./json/book.json", "w")
    write_book.write(JSON.generate(book))
    write_book.close
end

def list_books
  if File.exists?("./json/book.json")
    newbook=File.open("./json/book.json")
    if newbook.size.zero?
      puts 'create a new book'
    else
      books=JSON.parse(File.read("./json/book.json"))
      books.each do |book|
        book=Book.new(book["publisher"], book['cover_state'], book['publish_date'])
        @books << book
      end
    end
  else
    puts "create book records"
  end

  puts "Books are:"
  puts "\n"
  @books.each do |book| 
    puts "Publisher: #{book.publisher}"
    puts "Cover state: #{book.cover_state}"
    puts "Published on: #{book.publish_date}"
    puts "\n\n"
  end
end 

