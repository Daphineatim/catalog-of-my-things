require_relative '../music_album'
describe MusicAlbum do
  context 'When instancitiated and methods passed' do
    df = MusicAlbum.new('genre', 'author', 'source', 'label', 20, true)
    it 'expect on_spotify to be true' do
      expect(df.on_spotify).to eq true
    end
    it 'expect method can be archived to return true' do
      expect(df.can_be_archived?).to eq true
    end
  end
end
