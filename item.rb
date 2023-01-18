require 'time'
require 'date'
class Item
  def initialize(genre, author, source, label, publish_date)
    @id = rand(1..30)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def move_to_archive
    can_be_archived?
  end

  def can_be_archived?
    get_today_date = DateTime.now.strftime('%d/%m/')
    get_today_year = DateTime.now.strftime('%Y')
    today = get_today_date + (get_today_year.to_i - 10).to_s
    Date.strptime(@publish_date, '%d/%m/%y') > Date.strptime(today, '%d/%m/%y')
  end
end

cv = Item.new('genre', 'author', 'source', 'label', '02/02/2001')
puts cv.can_be_archived?
