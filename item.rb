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
    # Date.strptime(publish_date, '%Y/%m/%d')
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
    # @publish_date > 10
    # (@publish_date.year + 10) <= Date.today.year
    ((Date.today.year- @publish_date) / 31_536_000).floor > 10
  end
end

# fg = Item.new('genre', 'author', 'source', 'label', '2023-01-01')
# puts fg.can_be_archived?
# fg.move_to_archive
