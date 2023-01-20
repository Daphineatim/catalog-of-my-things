require 'time'
require 'date'
class Item
  
  attr_reader :genre, :source, :label
  attr_accessor :publish_date, :archived

  def initialize(publish_date, id = Random.rand(1..30))
    @id = id
    @publish_date = publish_date
    @archived = false
  end

  def author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)

  attr_accessor :publish_date, :archived
  attr_reader :genre, :author, :label

  def initialize(publish_date, id = Random.rand(1..100))
    @id = id
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def move_to_archive
    can_be_archived?
  end

  def author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
    
  end

  def can_be_archived?
    get_today_date = DateTime.now.strftime('%d/%m/')
    get_today_year = DateTime.now.strftime('%Y')
    today = get_today_date + (get_today_year.to_i - 10).to_s
    Date.strptime(@publish_date, '%d/%m/%y') > Date.strptime(today, '%d/%m/%y')
  end

  def add_label(label)
    @label = label
    label.add_item(label)
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end
end
