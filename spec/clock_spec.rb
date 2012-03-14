require_relative "../clock.rb"

describe Clock do
	context "yellow light" do
		it "is on, every other second" do
			assert_equal "Y", Clock.new "00:00:00"
		end
	end
end