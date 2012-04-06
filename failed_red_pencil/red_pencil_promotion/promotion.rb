class Promotion

  STABLE = 30

  def stable? price_history
    stable_checker = []
    STABLE.times { stable_checker << price_history.last }
    (price_history - stable_checker).length == price_history.length - STABLE
  end

  def price_decrease_valid_for_promotion? price_history
    if price_history.last <= price_history[-2] * 0.95
  end

 
end

























