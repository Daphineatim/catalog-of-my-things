require_relative 'item'

class Game < Item
	attr_accessor :multiplayer, :last_played_at
	attr_reader :publish_date, :archived

	def initialize(genre, author, source, label, publish_date,last_played_at,multiplayer, archived:false)
		super(genre, author, source, label, publish_date,archived:false)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

 def can_be_archived?
    super && Time.now.year - 2 > @last_played_at
  end

  def to_json(*args)
    {
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
    }.to_json(*args)
  end
end