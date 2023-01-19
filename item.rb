class Item
  attr_reader:genre, :author, :source, :label
  attr_accessor:publish_date,:archived
  def initialize(publish_date, id=Random.rand(1..30))
    @id=id
    @publish_date=publish_date
    @archived=false
  end

  def author=(author)
    author.items.push(self) unless author.items.include?(self)
    @author = author
  end

  def can_be_archived?
    publish_date > 10
  end

  def move_to_archive
    can_be_archived? ? true : ''
  end

end

