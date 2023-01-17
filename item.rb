class Book < Item
  attr_accessor :publisher, :cover_state

  alias can_be can_be_archived?

  def initialize(publisher, cover_state, publish_date, id = Random.rand(1..1000))
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad' || can_be
  end
end

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

  def move_to_archive
    can_be_archived?
  end

  def can_be_archived?
    @publish_date > 10
  end
end
