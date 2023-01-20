require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :publish_date

  def initialize(publish_date, last_played_at, multiplayer)
    super(publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived?
    super && (Date.today.year - Date.parse(last_played_at).year) > 2
  end
end
