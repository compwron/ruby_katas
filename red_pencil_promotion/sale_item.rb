class SaleItem
  def initialize
  end

  def stable? price_history
  	stable = true
  	if price_history.length <= 30
	    price_history.length.downto(price_history.length - 30) { |x|
	    	if price_history[x + 1] && price_history[x + 1] == price_history[x]
	    		stable
	    	else 
	    		stable = false
	    	end
	    }
  	end
  	stable
  end

  def valid_decrease? price_history
  	if price_history.last <= price_history[-2] * 0.95 && price_history.last >= price_history[-2] * 0.70
  		true
  	else
  		false
  	end
  end

  def valid_red_sale_start? price_history
  	stable?(price_history) && valid_decrease?(price_history)
  end 

  def red_sale_ends_today? price_history
  	pre_sale_price_history = price_history[0..price_history.length-30]
  	stable?(price_history) && stable?(pre_sale_price_history)
  end	

end
