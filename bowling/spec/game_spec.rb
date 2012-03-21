require_relative "../game.rb"

describe Game do

	before do
  	@game = first_frame(1, 4)
  	@game = not_first_frame(@game, 4, 5)
  	@game = not_first_frame(@game, 6, 4)
  	@game = not_first_frame(@game, 5, 5)
  	@game = not_first_frame(@game, 10, 0)
  	@game = not_first_frame(@game, 0, 1)
  	@game = not_first_frame(@game, 7, 3)
  	@game = not_first_frame(@game, 6, 4)
  	@game = not_first_frame(@game, 10, 0)
  	@game = not_first_frame(@game, 2, 8, 6)
	end

  it "first frame" do
  	score = 5
  	frame = 1
  	@game.score(frame).should == score
  end

  it "second frame" do
  	score = 14
  	frame = 2
  	@game.score(frame).should == score
  end

   it "third frame" do
  	score = 29
  	frame = 3
  	@game.score(frame).should == score
  end

  it "fourth frame" do
  	score = 49
  	frame = 4
  	@game.score(frame).should == score
  end

  it "fifth frame" do
  	score = 60
  	frame = 5
  	@game.score(frame).should == score
  end

  it "sixth frame" do
  	score = 61
  	frame = 6
  	@game.score(frame).should == score
  end

  it "seventh frame" do
  	score = 77
  	frame = 7
  	@game.score(frame).should == score
  end

  it "eighth frame" do
  	score = 97
  	frame = 8
  	@game.score(frame).should == score
  end

  it "ninth frame" do
  	score = 117
  	frame = 9
  	@game.score(frame).should == score
  end

  it "tenth frame" do
  	score = 133  
  	frame = 10
  	@game.score(frame).should == score
  end

  def first_frame(first_roll_pins, second_roll_pins)
  	game = Game.new
  	game.frame(first_roll_pins, second_roll_pins)
  	game
  end

  def not_first_frame(game, first_roll_pins, second_roll_pins, third_roll_pins=0)
  	game.frame(first_roll_pins, second_roll_pins, third_roll_pins)
  	game
  end
end









