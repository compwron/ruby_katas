require_relative "../fizzbuzz.rb"

describe FizzBuzz do
	before do
  	@fizbuzz = FizzBuzz.new
	end

  it "when given 1" do
  	@fizbuzz.evaluate(1).should == 1
  end

  it "when given 2" do
    @fizbuzz.evaluate(2).should == 2
  end

  it "when given 3" do
    @fizbuzz.evaluate(3).should == 'fizz'
  end

  it "when given 4" do
    @fizbuzz.evaluate(4).should == 4
  end

  it "when given 5" do
    @fizbuzz.evaluate(5).should == 'buzz'
  end

  it "when given 6" do
    @fizbuzz.evaluate(6).should == 'fizz'
  end

  it "when given 10" do
    @fizbuzz.evaluate(05).should == 'buzz'
  end

  it "when given 15" do
    @fizbuzz.evaluate(15).should == 'fizzbuzz'
  end
end
