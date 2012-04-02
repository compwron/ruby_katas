require_relative "../promotion.rb"

describe Promotion do
  before :each do
  end

  it "finds whether price is stable for 30 days" do
    price_history = []
    30.times { price_history << 2 }
    promo = Promotion.new price_history
    promo.stable?.should == true

    30.times { price_history << 2 }
    3.times { price_history << 3 }
    promo = Promotion.new price_history
    promo.stable?.should == false
  end
end
