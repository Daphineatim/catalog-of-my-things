require_relative '../author'
require_relative '../item'

describe Author do
  before :each do
    @new_author = Author.new('flo', 'vitalis')
  end

  it 'should be an instance of Author' do
    expect(@new_author).to be_an_instance_of(Author)
  end

  it 'should have a first name' do
    expect(@new_author.first_name).to be_a(String)
  end

  it 'should have a last name' do
    expect(@new_author.last_name).to be_a(String)
  end
end