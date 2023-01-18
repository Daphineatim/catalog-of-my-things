require_relative '../genre'
require_relative '../item'

describe Genre do
  context 'show association' do
    fg = Item.new('genre', 'author', 'source', 'label', 20)
    gh = Genre.new('best')
    it 'expect the name to be best' do
      expect(gh.name).to eq 'best'
    end
    it 'when an item created should be present in child' do
      gh.add_item(fg)
      expect(gh.items.size).to be > 0
    end
  end
end
