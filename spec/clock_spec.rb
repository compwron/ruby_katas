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
end