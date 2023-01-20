require_relative '../label'
require_relative '../item'

describe Label do
  context 'Given an instance of a book' do
    before :each do
      @labels = Label.new('gift', 'red')
    end
    fg = Item.new('01/01/2001', 20)
    gh = Label.new('gift', 'red')
    it 'returns a new label' do
      expect(@labels).to be_instance_of Label
    end

    it 'check correct title' do
      @labels.title = 'gift'
      expect(@labels.title).to eql 'gift'
    end

    it 'check correct title' do
      @labels.color = 'red'
      expect(@labels.color).to eql 'red'
    end

    it 'when an item created should be present in child' do
      gh.add_item(fg)
      expect(gh.items.size).to be > 0
    end
  end
end
