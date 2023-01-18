require_relative 'item'
class MusicAlbum < Item
  attr_accessor :on_spotify, :genre, :author, :source, :label, :publish_date

  def initialize(genre, author, source, label, publish_date, on_spotify) # rubocop:disable Metrics/ParameterLists
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
