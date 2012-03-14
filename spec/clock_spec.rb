require_relative "../clock.rb"

describe Clock do
	context "yellow light" do
		it "is on, every other second" do
      $stdout.should_receive(:puts).with("Y")
      $stdout.should_receive(:puts).with("OOOO")
			c = Clock.new("00:00:00")
		end
		
		it "is off on odd-numbered seconds" do
		  $stdout.should_receive(:puts).with("O")
		  $stdout.should_receive(:puts).with("OOOO")
			c = Clock.new("00:00:01")
		end
	end

	context "hour lamps" do
		it "shows four lamps on row 2 for 10am" do
		  $stdout.should_receive(:puts).with("Y")
		  $stdout.should_receive(:puts).with("RROO")
			c = Clock.new("10:00:00")
		end
		
		it "shows lamps on both rows for 11am" do
		  $stdout.should_receive(:puts).with("Y")
		  $stdout.should_receive(:puts).with("RROO")
		  $stdout.should_receive(:puts).with("ROOO")
			c = Clock.new("11:00:00")
		end
	end
end