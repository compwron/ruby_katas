class Promotion
  
  def initialize price_history
    @price_history = price_history
  end

  def stable?
    stable = false
    price_stability_checker = {}
    @price_history.each { |price|
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

# assume that last price is the decrease and that all the ones before that are stable
  def price_decrease_valid_for_promotion?
    promotion_triggering_price = @price_history[-2]
    if 0.70 * promotion_triggering_price < @price_history.last && @price_history.last <= 0.95 * promotion_triggering_price
      true
    else
      false
    end
  end

  def red_pencil_sale?
    # p @price_history
    days_on_sale = 0
    @price_history.each {|i|
      days_on_sale += 1 if i == @price_history.last 
      return false if days_on_sale > 30 
    }
    true
  end
end
