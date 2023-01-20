require_relative '../book'
require_relative '../item'


describe Book do
  before :all do
    @book = Book.new('Natanim', 'bad', '2023-01-10')
  end

  context '#Given parameters' do
    it 'should be an instance of book' do
      expect(@book).to be_instance_of(Book)
    end

    it 'Should instantiate with given properties' do
      expect(@book.publisher).to eql('Natanim')
    end

    it 'Should instantiate with given properties' do
      expect(@book.cover_state).to eql('bad')
    end
end
end

