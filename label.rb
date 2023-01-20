class Label
  attr_accessor :title, :color

  def initialize(title, color, _id = Random.rand(1..1000))
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
  end
end