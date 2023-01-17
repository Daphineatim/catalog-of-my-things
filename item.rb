class Item
  def initialize(genre, author, source, label, publish_date, archived:false)
    @id=Random.rand(1..30)
    @genre= genre
    @author=author
    @source=source
    @label=label
    @publish_date=publish_date
    @archived=archived
  end

  def can_be_archived?
    publish_date > 10
  end

  def move_to_archive
    can_be_archived? ? true : ''
  end

end

