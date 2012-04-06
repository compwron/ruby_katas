class Promotion
  def initialize
    @sale_ongoing = false
  end

  def stable? price_history
    stable = false
    price_stability_checker = {}
    price_history.each { |price|
      if price_stability_checker[price] 
        price_stability_checker[price] += 1
      else
        price_stability_checker[price] = 1
      end
    }
    price_stability_checker.each { |price, occurrences|
      if occurrences >= 30 then stable = true end
    }
    stable
  end

  def price_decrease_valid_for_promotion? price_history
    promotion_triggering_price = price_history[-2]
    result = false
    if 0.70 * promotion_triggering_price < price_history.last && price_history.last <= 0.95 * promotion_triggering_price 
      result = true
    end
    result
  end

  def is_last_day_of_red_pencil_sale? price_history
    days_on_sale = 0
    most_recent_price = price_history.last
    price_history.each { |i|
      days_on_sale += 1 if i == price_history.last
    }
    days_on_sale == 30 
  end

  def red_pencil_sale? price_history
    days_on_sale = 0
    price_history.each { |i|
      days_on_sale += 1 if i == price_history.last 
      return false if days_on_sale > 30 
    }
    true
  end
end
