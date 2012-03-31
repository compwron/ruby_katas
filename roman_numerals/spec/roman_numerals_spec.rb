require_relative "../roman_numerals.rb"

describe RomanNumeral do
	before do
  	@rn = RomanNumeral.new
	end

  it "when given 1" do
  	@rn.roman(1).should == 'I'
  end

  it "when given 2" do
    @rn.roman(2).should == 'II'
  end

  it "when given 3" do
    @rn.roman(3).should == 'III'
  end

  it "when given 4" do
    @rn.roman(4).should == 'IV'
  end

  # it "when given 1" do
  #   @rn.roman(1).should == 'I'
  # end

  # it "when given 1" do
  #   @rn.roman(1).should == 'I'
  # end
end
