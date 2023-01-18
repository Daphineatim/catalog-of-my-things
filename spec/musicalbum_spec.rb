require_relative '../music_album'
describe MusicAlbum do
  df = MusicAlbum.new('genre', 'author', 'source', 'label', '01/02/2001', true)
  context 'When instancitiated and methods passed' do
    it 'expect on_spotify to be true' do
      expect(df.on_spotify).to eq true
    end
    it 'expect method can be archived to return true' do
      expect(df.can_be_archived?).to eq true
    end
  end
end
