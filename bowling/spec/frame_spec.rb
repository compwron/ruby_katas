require_relative "../game.rb"
require_relative "../roll.rb"
require_relative "../frame.rb"

describe Frame do

# does the game need to be at end state, or at progressive state? 
  it "understands a strike" do
  	strike = Roll.new(1, 10) # roll 1, 10 pins down
  	frame_number = 1
  	frame = Frame.new(frame_number, strike)

  	frame.is_strike?.should be_true
  end

  it "ends frame after strike" do
  	strike = Roll.new(1, 10) # roll 1, 10 pins down
  	frame_number = 1
  	frame = Frame.new(frame_number, strike)

  	frame.is_over?.should == true
  end

  it "does not end frame after strike" do
  	roll = Roll.new(1, 5) # roll 1, 5 pins down
  	frame_number = 1
  	frame = Frame.new(frame_number, roll)

  	frame.is_over?.should == false
  end
end









