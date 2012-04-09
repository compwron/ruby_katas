require_relative "../sale_item.rb"

describe SaleItem do

  subject { SaleItem.new }

  before :all do
  	@stable_hist = [2] + [1] * 30
  	@stable_then_unstable_hist = [2] + [1] * 30 + [3]
  	@too_short_to_be_stable_hist = [1] * 28

  	@valid_decrease = [100] * 31 + [90]
  	@not_large_enough_decrease = [100] * 31 + [99]
  	@too_large_decrease = [100] * 31 + [50]

  	@lowest_valid_decrease = [100] * 30 + [70]
  	@valid_decrease_not_preceeded_by_stability = [100] * 28 + [90]

  	@last_day_of_red_sale = [100] * 31 + [90] * 30
  	@red_sale_ended_yesterday = [100] * 31 + [90] * 31

  	@price_reduced_during_sale = [100] * 30 + [90] * 29 + [80]
  end

  context "price" do
	  it "is stable for 30 days" do
	  	subject.stable?(@stable_hist).should == true
	  	subject.stable?(@stable_then_unstable_hist).should == false
	  	subject.stable?(@too_short_to_be_stable_hist).should == false
	  end
	  
	  it "decrease is valid when it is between 5 and 30% downwards" do
  		subject.valid_decrease?(@valid_decrease).should == true
  		subject.valid_decrease?(@not_large_enough_decrease).should == false
  		subject.valid_decrease?(@too_large_decrease).should == false
  	end
	end

  context "red sale" do
  	it "starts when it should" do
	  	subject.valid_red_sale_start?(@valid_decrease).should == true
	  	subject.valid_red_sale_start?(@lowest_valid_decrease).should == true
	  	subject.valid_red_sale_start?(@too_large_decrease).should == false
	  	subject.valid_red_sale_start?(@valid_decrease_not_preceeded_by_stability).should == false
  	end

	  it "ends on time" do
	  	subject.red_sale_ends_today?(@last_day_of_red_sale).should == true
	  	subject.red_sale_ends_today?(@red_sale_ended_yesterday).should == false
	  end

	  it "is not prolonged by reduction during sale" do
	  	subject.red_sale_ends_today?(@price_reduced_during_sale).should == true
	  end

	  it "is ended immediately by price increase" do
	  	subject.red_sale_ends_today?([100] * 30 + [90] * 25 + [91]).should == true
	  	subject.red_sale_ends_today?([100] * 30 + [90] * 28 + [89]).should == false
	  	subject.red_sale_ends_today?([100] * 30 + [90] * 29 + [89]).should == true
	  end

	  it "is ended immediately by price decrease to below 30% of original price" do
	  	subject.price_decreases_below_threshhold?([100] * 30 + [90] * 25 + [50]).should == true
	  	subject.price_decreases_below_threshhold?([100] * 30 + [90] * 25 + [89]).should == false
	  	
	  	subject.red_sale_ends_today?([100] * 30 + [90] * 25 + [89]).should == false
	  	subject.red_sale_ends_today?([100] * 30 + [90] * 25 + [50]).should == true
	  end
	end
	
	it "find most recent stable price" do
		subject.get_position_of_most_recent_stable_price([100] * 30 + [90]).should == 29
  	subject.get_position_of_most_recent_stable_price([101] + [100] * 30 + [90]).should == 30
  	subject.get_position_of_most_recent_stable_price([101] * 30 + [100] * 30 + [90]).should == 59
	end


end

