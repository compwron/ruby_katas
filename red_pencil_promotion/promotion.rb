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
   
end
