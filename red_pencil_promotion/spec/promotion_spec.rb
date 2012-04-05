require_relative "../promotion.rb"

describe Promotion do
  before :each do
  end

  it "finds whether price is stable for 30 days" do
    price_history = []
    30.times { price_history << 2 }
    promo = Promotion.new price_history
    promo.stable?.should == true
  end
  
  it "finds that price is unstable if it changes before 30 days" do
    price_history = []
    28.times { price_history << 2 }
    3.times { price_history << 3 }
    promo = Promotion.new price_history
    promo.stable?.should == false
  end

  it "finds whether price is stable in the middle of change" do
    price_history = []
    2.times { price_history << 200 }
    30.times { price_history << 100 }
    3.times { price_history <<  90 }
    promo = Promotion.new price_history
    promo.stable?.should == true
  end

  it "price reduction is between 5 and 30 percent of stable price" do
    price_history = []
    30.times { price_history << 100 }
    price_history << 90
    promo = Promotion.new price_history
    promo.price_increase_valid_for_promotion?.should == true

    30.times { price_history << 100 }
    price_history << 2
    promo = Promotion.new price_history
    promo.price_increase_valid_for_promotion?.should == false
  end
end

















