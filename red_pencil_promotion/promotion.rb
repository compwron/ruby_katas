class Promotion
  
  def initialize price_history
    @price_history = price_history
  end

  def stable?
    old_price = @price_history.last
    stable = true
    (@price_history.length - 1).downto(@price_history.length - 30) do |price|
      stable = false unless @price_history[price] == old_price 
    end
    stable
  end

end
