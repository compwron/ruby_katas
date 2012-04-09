class SaleItem
  def initialize
  end

  STABLE = 30

  def stable? price_history
  	most_recent_price = price_history.last
  	!1.upto(STABLE - 1).map {|i|
  		price_history.pop
  		price_history.last == most_recent_price
  	}.include?(false)
  end

  def valid_decrease? price_history
  	if price_history.last <= price_history[-2] * 0.95 && price_history.last >= price_history[-2] * 0.70
  		true
  	else
  		false
  	end
  end

  def valid_red_sale_start? price_history
  	price_history_today = price_history
  	price_history_yesterday = price_history[0..price_history.length - 2]
  	valid_decrease?(price_history_today) && stable?(price_history_yesterday)

  end 

  # def red_sale_ends_today? price_history
  # 	pre_sale_price_history = price_history[0..price_history.length-30]
  # 	# p pre_sale_price_history
  # 	stable?(price_history) && stable?(pre_sale_price_history)
  # end	

end
