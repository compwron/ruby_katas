class SaleItem
  def initialize
    @price_history = []
  end

  def stable? price_history
    true
  end

end