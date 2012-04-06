class Promotion

  STABLE = 30
  PRICE_RANGE_TOP = 0.95
  PRICE_RANGE_BOTTOM = 0.70

  def stable? price_history
    stable_checker = []
    STABLE.times { stable_checker << price_history.last }
    (price_history - stable_checker).length == price_history.length - STABLE
  end

  def price_decrease_valid_for_promotion? price_history
    promotion_triggering_price = price_history[-2]
    (PRICE_RANGE_BOTTOM * promotion_triggering_price < price_history.last && price_history.last <= PRICE_RANGE_TOP * promotion_triggering_price) ? true : false
  end

  def is_last_day_of_red_pencil_sale? price_history
    most_recent_price = price_history.last
    price_history.map { |price|
      price == price_history.last ? days_on_sale += 1 : days_on_sale
    }.include?(STABLE)
  end

  def red_pencil_sale? price_history
    days_on_sale = 0
    price_history.each { |i|
      days_on_sale += 1 if i == price_history.last 
      return false if days_on_sale > STABLE 
    }
    true
  end
end
