require_relative 'item'
class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = rand(1..30)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
  end

  def to_s
    @name
  end
end
