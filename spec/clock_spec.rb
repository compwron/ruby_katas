require_relative "../clock.rb"

describe Clock do
	context "yellow light" do
		it "is on, every other second" do
      $stdout.should_receive(:puts).with("Y")
			c = Clock.new("00:00:00")
		end
		
		it "is off on odd-numbered seconds" do
		  $stdout.should_receive(:puts).with("O")
			c = Clock.new("00:00:01")
		end
	end

	context "hour lamps" do
		it "shows four lamps on row 2 for 10am" do
		  $stdout.should_receive(:puts).with("Y\nRROO")
			c = Clock.new("00:10:00")
		end
	end
end