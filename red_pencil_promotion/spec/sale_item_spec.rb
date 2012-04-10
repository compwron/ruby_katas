require_relative "../sale_item.rb"

describe SaleItem do

  subject { SaleItem.new }

  before :all do
    @stable_hist = [2] + [1] * 30
    @stable_then_unstable_hist = [2] + [1] * 30 + [3]
    @too_short_to_be_stable_hist = [1] * 28

    @valid_decrease = [100] * 31 + [90]
    @too_small_decrease = [100] * 31 + [99]
    @too_large_decrease = [100] * 31 + [50]

    @lowest_valid_decrease = [100] * 30 + [70]
    @valid_decrease_not_preceeded_by_stability = [100] * 28 + [90]

    @last_day_of_red_sale = [100] * 31 + [90] * 30
    @red_sale_ended_yesterday = [100] * 31 + [90] * 31

    @price_reduced_on_last_day_of_sale = [100] * 30 + [90] * 29 + [80]
    @price_increased_during_sale = [100] * 30 + [90] * 25 + [91]
    @price_reduced_during_sale = [100] * 30 + [90] * 28 + [89]

    @too_large_decrease_during_sale = [100] * 30 + [90] * 25 + [50]
    @valid_decrease_during_sale = [100] * 30 + [90] * 25 + [89]

    # second sales
    @valid_second_sale = [100] * 30 + [90] * 30 + [90] * 30 + [81]
    @invalid_second_sale = [100] * 30 + [90] * 30 + [81]
    @valid_second_sale_history_preceeded_by_instability = [2] + [100] * 30 + [90] * 30 + [90] * 30 + [81]
    @stable_from_beginning = [100] * 30 + [90] * 30 + [90] * 30 + [81]
    @stable_at_1 = [2] + [100] * 30 + [90] * 30 + [90] * 30 + [81]
    @stable_at_2 = [2] + [14] + [100] * 30 + [90] * 30 + [90] * 30 + [81]
  end

  context "price" do
    it "is stable for 30 days" do
      subject.stable?(@stable_hist).should == true
      subject.stable?(@stable_then_unstable_hist).should == false
      subject.stable?(@too_short_to_be_stable_hist).should == false
    end
    
    it "decrease is valid when it is between 5 and 30% downwards" do
      subject.valid_decrease?(@valid_decrease).should == true
      subject.valid_decrease?(@too_small_decrease).should == false
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
      subject.red_sale_ends_today?(@price_reduced_on_last_day_of_sale).should == true
    end

    it "is ended immediately by price increase" do
      subject.red_sale_ends_today?(@price_increased_during_sale).should == true
      subject.red_sale_ends_today?(@price_reduced_during_sale).should == false
      subject.red_sale_ends_today?(@price_reduced_on_last_day_of_sale).should == true
    end

    it "is ended immediately by price decrease to below 30% of original price" do
      subject.price_decreases_below_threshold?(@too_large_decrease_during_sale).should == true
      subject.price_decreases_below_threshold?(@valid_decrease_during_sale).should == false
      
      subject.red_sale_ends_today?(@valid_decrease_during_sale).should == false
      subject.red_sale_ends_today?(@too_large_decrease_during_sale).should == true
    end
  end
  
  it "find most recent stable price" do
    subject.position_of_most_recent_stable_price(@valid_decrease).should == 30
  end

  it "second red sale is valid if it is preceeded by a period of stability which does not overlap with the previous red sale" do
    subject.no_overlap_with_previous_sale(@stable_from_beginning)
  end

  it "second red sale must follow a stable period which does not intersect with a previous red sale" do
    subject.valid_red_sale_start?(@valid_second_sale).should == true
    subject.valid_red_sale_start?(@invalid_second_sale).should == false
    subject.valid_red_sale_start?(@valid_second_sale_history_preceeded_by_instability).should == true
  end

  it "second red sale should be valid when the history includes valid instabilities" do
    # subject.triply_stable?(@valid_second_sale_history_preceeded_by_instability).should == false

    
    subject.beginning_of_stability_position(@stable_from_beginning).should == 0
    subject.beginning_of_stability_position(@stable_at_1).should == 1
    subject.beginning_of_stability_position(@stable_at_2).should == 2
    
    # @unstable_between_red_sales = [100] * 30 + [90] * 30 + [2] + [90] * 30 + [81]
    # @longer_unstable_between_red_sales = [100] * 30 + [90] * 30 + [2] * 5 + [90] * 30 + [81]
    # subject.valid_red_sale_start?(@unstable_between_red_sales).should == true


  end

end
















