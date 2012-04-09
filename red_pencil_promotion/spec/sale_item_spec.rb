require_relative "../sale_item.rb"

describe SaleItem do

  subject { SaleItem.new }

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

  context "red sale" do
	  it "ends on time" do
	  	subject.red_sale_ends_today?([100] * 31 + [90] * 30).should == true
	  	subject.red_sale_ends_today?([100] * 31 + [90] * 31).should == false
	  end

	  it "is not prolonged by reduction during sale" do
	  	subject.red_sale_ends_today?([100] * 30 + [90] * 29 + [80]).should == true
	  	# subject.valid_red_sale_start?([100] * 30 + [90] * 30 + [80]).should == false
	  end

	  it "is ended immediately by price increase" do
	  	subject.red_sale_ends_today?([100] * 30 + [90] * 25 + [91]).should == true
	  	subject.red_sale_ends_today?([100] * 30 + [90] * 28 + [89]).should == false
	  	subject.red_sale_ends_today?([100] * 30 + [90] * 29 + [89]).should == true
	  end

	  it "is ended immediately by price decrease to below 30% of original price" do
	  	subject.get_most_recent_stable_price([100] * 30 + [90]).should == 100
	  	subject.get_most_recent_stable_price([101] + [100] * 30 + [90]).should == 100
	  	# subject.get_most_recent_stable_price([101] * 30 + [100] * 30 + [90]).should == 100

	  	# subject.find_price_before_sale([100] * 30 + [90] * 25 + [89]).should == 100
	  	# subject.price_decreases_below_threshhold([100] * 30 + [90] * 25 + [89]).should == false

	  	# subject.price_decreases_below_threshhold([100] * 30 + [90] * 25 + [69]).should == true
	  end
	end
end

