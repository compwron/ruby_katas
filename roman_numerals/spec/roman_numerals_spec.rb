require_relative "../roman_numerals.rb"

describe RomanNumeral do
  before :each do
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

  it "when given 5" do
   @rn.roman(5).should == 'V'
  end

  it "when given 6" do
   @rn.roman(6).should == 'VI'
  end

  it "when given 7" do
   @rn.roman(7).should == 'VII'
  end

  it "when given 8" do
   @rn.roman(8).should == 'VIII'
  end

  it "when given 9" do
   @rn.roman(9).should == 'IX'
  end

  it "when given 1069" do
   @rn.roman(1069).should == 'MLXIX'
  end

  it "when given 1065" do
   @rn.roman(1065).should == 'MLXV'
  end

  it "when given 10" do
   @rn.roman(10).should == 'X'
  end

  it "when given 50" do
   @rn.roman(50).should == 'L'
  end

  it "when given 1050" do
    @rn.roman(1050).should == 'ML'
  end
  
  it "when given 500" do
    @rn.roman(500).should == 'D'
  end

  it "when given 1500" do
    @rn.roman(1500).should == 'MD'
  end

  it "when given 1000" do
    @rn.roman(1000).should == 'M'
  end

  it "when given 2000" do
    @rn.roman(2000).should == 'MM'
  end
end
