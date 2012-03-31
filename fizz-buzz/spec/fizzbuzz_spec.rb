require_relative "../fizzbuzz.rb"

describe FizzBuzz do

	before do
  	@fizbuzz = FizzBuzz.new
	end

  it "when given 1" do
  	@fizbuzz.evaluate(1).should == 1
  end

end









