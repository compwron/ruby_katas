require_relative "../sale_item.rb"

describe SaleItem do

  subject { SaleItem.new }

	before do
	end

  it "price is stable for 30 days" do
  	subject.stable?([2] + [1] * 30).should == true
  	subject.stable?([2] + [1] * 30 + [3]).should == false
  	subject.stable?([1] * 28).should == false
  	subject.stable?([[100] * 31 + [90] * 2]).should == false
  end

  it "sale-valid price change is between 5 and 30% downwards" do
  	subject.valid_decrease?([100] * 31 + [90]).should == true
  	subject.valid_decrease?([100] * 31 + [99]).should == false
  	subject.valid_decrease?([100] * 31 + [50]).should == false
  end

  it "valid red sale start" do
  	subject.valid_red_sale_start?([100] * 31 + [90]).should == true
  	subject.valid_red_sale_start?([100] * 30 + [70]).should == true
  	subject.valid_red_sale_start?([100] * 31 + [50]).should == false
  	subject.valid_red_sale_start?([100] * 28 + [90]).should == false
  end

  it "red sale ends on time" do
  	subject.red_sale_ends_today?([100] * 31 + [90] * 30).should == true
  	subject.red_sale_ends_today?([100] * 31 + [90] * 31).should == false
  end
end

