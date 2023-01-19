require 'time'
require 'date'
class Item
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

  def can_be_archived?
    @publish_date > 10
  end

  def add_label(label)
    @label = label
    label.add_item(label)
  end

  def add_author(author)
    @author = author
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_source(source)
    @source = source
  end
end
