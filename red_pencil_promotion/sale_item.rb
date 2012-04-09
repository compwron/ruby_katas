class SaleItem
  STABLE = 30
  TOP_SALE_PRICE_PERCENTAGE = 0.95
  BOTTOM_SALE_PRICE_PERCENTAGE = 0.70

  def stable? price_history
  	most_recent_price = price_history.last
  	!1.upto(STABLE - 1).map {|i|
  		price_history.pop
  		price_history.last == most_recent_price
  	}.include?(false)
  end

  def valid_decrease? price_history
  	(price_history.last <= price_history[-2] * TOP_SALE_PRICE_PERCENTAGE && price_history.last >= price_history[-2] * BOTTOM_SALE_PRICE_PERCENTAGE) ? true : false
  end

  def valid_red_sale_start? price_history
  	price_history_today = price_history
  	price_history_yesterday = price_history[0..price_history.count - 2]
  	valid_decrease?(price_history_today) && stable?(price_history_yesterday)
  end 

  def red_sale_ends_today? price_history
  	return true unless sale_ends_if_price_increases(price_history) == false
  	# return true unless price_decreases_below_threshhold(price_history) == false
  	sale_has_lasted_max_length(price_history)
  end	

  def sale_ends_if_price_increases price_history
  	price_history.last > price_history[-2] ? true : false
  end

  def price_decreases_below_threshhold
  end

  def find_price_before_sale price_history
		threshhold = get_most_recent_stable_price price_history
		# threshhold_value = price_history[threshhold]

		lowest_valid_sale_price = BOTTOM_SALE_PRICE_PERCENTAGE * threshhold

		if valid_red_sale_start?(price_history[threshhold + 1])
			(threshhold + 1).upto(price_history.last).each {|i|
				return true if price_history[i] >= lowest_valid_sale_price
			}
		end
		# find the original increase
		# - by, starting at the 30th value, checking for stability and incrementing until it is found
		# calculate the threshhold
		# for each value after the threshhold, check if value is above the threshhold

  end

  def get_position_of_most_recent_stable_price price_history
  	threshhold = 0
  	length_of_history = price_history.length - 1
		(STABLE - 1).upto(length_of_history).each {|i|
			if stable?(price_history[0..i]) then threshhold = i end
		}
		threshhold
  end

  def sale_has_lasted_max_length price_history
  	pre_sale_price_history = price_history[0..price_history.count - 1 - STABLE]
  	stable?(pre_sale_price_history) 
  end
end
