require_relative "../sale_item.rb"

describe SaleItem do

  subject { SaleItem.new }

	before do
	end

  it "hi" do
    price_history = nil
    subject.stable?(price_history).should == true
  end
end

