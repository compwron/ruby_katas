class SaleItem
  STABLE = 30
  STABLE_LOCATION = STABLE - 1
  TOP_SALE_PRICE_PERCENTAGE = 0.95
  BOTTOM_SALE_PRICE_PERCENTAGE = 0.70
  SECOND_MOST_RECENT_ARRAY_LOCATION = -2

  def stable? price_history
    most_recent_price = price_history.last
    1.upto(STABLE_LOCATION).inject(true) {|no_false_so_far, i|
      price_history.pop
      no_false_so_far && price_history.last == most_recent_price
    }
  end

  def valid_decrease? price_history
    price_history.last <= price_history[SECOND_MOST_RECENT_ARRAY_LOCATION] * TOP_SALE_PRICE_PERCENTAGE && 
      price_history.last >= price_history[-2] * BOTTOM_SALE_PRICE_PERCENTAGE ? 
        true : false
  end

  def valid_red_sale_start? price_history
    yesterday_hist = price_history_yesterday(price_history)
    valid = valid_decrease?(price_history) && stable?(yesterday_hist) 
    price_history.length >= 60 ? (no_overlap_with_previous_sale(price_history) && valid) : valid
  end 

  def price_history_yesterday price_history
    second_most_recent_price_location = price_history.count + SECOND_MOST_RECENT_ARRAY_LOCATION
    price_history[0..second_most_recent_price_location]
  end

  def no_overlap_with_previous_sale price_history
    # make an array which holds the points in the array during which there was a red sale 
    # {price_history => [{:red_sale => [30..60], :stable => [0..29], [61..89]}]}
    return false unless price_history.length >= 90
    i = beginning_of_stability_position(price_history)
    unstable_offset = between_sale_unstable_offset(price_history)

    stable?(price_history[i..STABLE_LOCATION + i]) && # first period of stability
      stable?(price_history[i + STABLE_LOCATION..STABLE*2 + i]) && # first red sale
      # this is where the valid between-sale stability could be
        stable?(price_history[STABLE*2 + i + unstable_offset..STABLE*3 -1 + i + unstable_offset]) && # second period of stability
          valid_decrease?(price_history)
  end

  def between_sale_unstable_offset price_history
    0
  end

  def beginning_of_stability_position price_history
    max_unstable_offset = price_history.length - 90
    beginning_of_stability  = 0
    (0..max_unstable_offset).each {|i|
      beginning_of_stability = i + 1 if stable?(price_history[i..i + STABLE])
    }
    beginning_of_stability
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
    last_stable_position = position_of_most_recent_stable_price(price_history)
    lowest_valid_sale_price = BOTTOM_SALE_PRICE_PERCENTAGE * price_history[last_stable_position]
    last_stable_position.upto(price_history.length - 1).each do |i|
      return true if price_history[i] <= lowest_valid_sale_price
    end
    false
  end

  def position_of_most_recent_stable_price price_history
    threshold = 0
    length_of_history = price_history.length - 1
    STABLE_LOCATION.upto(length_of_history).each do |i|
      return i + 1 if stable?(price_history[0..i]) # off by 1 error?
    end
  end

  def sale_has_lasted_max_length price_history # needs more test cases?
    pre_sale_price_history = price_history[0..price_history.count - 1 - STABLE]
    stable?(pre_sale_price_history) 
  end
end
