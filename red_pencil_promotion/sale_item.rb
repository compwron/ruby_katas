class SaleItem
  STABLE = 30
  STABLE_LOCATION = STABLE - 1
  TOP_SALE_PRICE_PERCENTAGE = 0.95
  BOTTOM_SALE_PRICE_PERCENTAGE = 0.70
  SECOND_MOST_RECENT_ARRAY_LOCATION = -2

  def stable? price_history
  	most_recent_price = price_history.last
  	!1.upto(STABLE_LOCATION).map {|i|
  		price_history.pop
  		price_history.last == most_recent_price
  	}.include?(false)
  end

  def valid_decrease? price_history
  	price_history.last <= price_history[SECOND_MOST_RECENT_ARRAY_LOCATION] * TOP_SALE_PRICE_PERCENTAGE && 
  		price_history.last >= price_history[-2] * BOTTOM_SALE_PRICE_PERCENTAGE ? 
  			true : false
  end

  def valid_red_sale_start? price_history
  	second_most_recent_price_location = price_history.count + SECOND_MOST_RECENT_ARRAY_LOCATION
  	price_history_yesterday = price_history[0..second_most_recent_price_location]
  	valid_decrease?(price_history) && stable?(price_history_yesterday)
  end 

  def red_sale_ends_today? price_history
  	price_increased_during_sale?(price_history) || 
  		price_decreases_below_threshold?(price_history) || 
  			sale_has_lasted_max_length(price_history)
  end	

  def price_increased_during_sale? price_history
  	price_history.last > price_history[SECOND_MOST_RECENT_ARRAY_LOCATION]
  end

  def price_decreases_below_threshold? price_history
		threshold = get_position_of_most_recent_stable_price price_history
		lowest_valid_sale_price = BOTTOM_SALE_PRICE_PERCENTAGE * price_history[threshold]
			threshold.upto(price_history.length - 1).map do |i|
				return true if price_history[i] <= lowest_valid_sale_price
			end
		false
  end

  def get_position_of_most_recent_stable_price price_history
  	threshold = 0
  	length_of_history = price_history.length - 1
		(STABLE - 1).upto(length_of_history).each {|i|
			if stable?(price_history[0..i]) then threshold = i end
		}
		threshold
  end

  def sale_has_lasted_max_length price_history
  	pre_sale_price_history = price_history[0..price_history.count - 1 - STABLE]
  	stable?(pre_sale_price_history) 
  end
end
