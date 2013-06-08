require_relative "../game.rb"
require_relative "../roll.rb"
require_relative "../frame.rb"

describe Game do

# does the game need to be at end state, or at progressive state? 
  it "complete game" do
    strike = Roll.new(1, 10)
    spare = Frame.new(Roll.new(1, 5), Roll.new(2, 5))
    frames = [Frame.new(strike), spare]
    incomplete_game = Game.new(frames)
  end
end









