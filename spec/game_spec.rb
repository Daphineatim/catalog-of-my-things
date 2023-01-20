require_relative '../game'
require_relative '../item'

describe Game do
  before :each do
    @new_game = Game.new(true, '10/02/2022', false)
  end

  it 'should be an instance of Game' do
    expect(@new_game).to be_an_instance_of(Game)
  end
end
