require_relative '../author'
require_relative '../item'

describe Author do
  before :each do
    @new_author = Author.new('flo', 'vitalis')
  end
  fg = Item.new('01/01/2001', 20)
  gh = Author.new('flo', 'vitalis')
  it 'should be an instance of Author' do
    expect(@new_author).to be_an_instance_of(Author)
  end

  it 'should have a first name' do
    expect(@new_author.first_name).to be_a(String)
  end

  it 'should have a last name' do
    expect(@new_author.last_name).to be_a(String)
  end

  it 'when an item created should be present in child' do
    gh.add_item(fg)
    expect(gh.items.size).to be > 0
  end

end
