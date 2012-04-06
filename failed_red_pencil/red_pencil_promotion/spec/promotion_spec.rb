require_relative "../promotion.rb"

describe Promotion do

  before :all do
    @stable_price_history = [2] * 30
    @unstable_then_stable_price_history = [3] * 5 + [2] * 30
    @unstable_price_history = [2] * 28 + [3] * 5
    @valid_price_decrease = [100] * 30 + [90]
    @invalid_price_decrease = [100] * 30 + [50]
  end

  it "finds whether price is stable for 30 days" do
    Promotion.new.stable?(@stable_price_history).should == true
    Promotion.new.stable?(@unstable_then_stable_price_history).should == true
  end
  
  it "finds that price is unstable if it changes before 30 days" do
    Promotion.new.stable?(@unstable_price_history).should == false
  end

  it "price reduction is between 5 and 30 percent of stable price" do
    Promotion.new.price_decrease_valid_for_promotion?(@valid_price_decrease).should == true

    Promotion.new.price_decrease_valid_for_promotion?(@invalid_price_decrease).should == false
  end

  # it "red pencil sale ends after 30 days" do
  #   price_history = []
  #   30.times { price_history << 100 }
  #   # 29.times { price_history << 90 }
  #   30.times { price_history << 90 }
  #   Promotion.new.red_pencil_sale_ended?(price_history).should == true
    
    # price_history << 90
    # Promotion.new.red_pencil_sale_ended?(price_history).should == true

    # price_history << 90
    # Promotion.new.red_pencil_sale_ended?(price_history).should == false
  # end

  # it "if price goes down the day after the 30th day of the sale, sale is not prolonged." do
  #   price_history = []
  #   30.times { price_history << 100 }
  #   30.times { price_history << 90 }
  #   1.times { price_history << 80 }
  #   Promotion.new.price_decrease_valid_for_promotion?(price_history).should == false
  # end
end
