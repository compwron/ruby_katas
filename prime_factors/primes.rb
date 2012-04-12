require 'mathn'

class Primes
  def primes num
  	num ==1 ? [] : num.prime? ? [num] : prime_factors(num)
  end

  def prime_factors num
  	factors(num).select {|factor| factor.prime?}.map {|prime_factor|
      (num / prime_factor) % prime_factor == 0 ? repeated_factors(num, prime_factor) : prime_factor
    }.flatten
  end

  def factors num
  	1.upto(num).select {|i|
  		num % i == 0
  	}
  end

  def repeated_factors(num, factor, factors=[factor])
    if (num / factor) == 1
      return factors
    else 
      factors << factor
      repeated_factors(num / factor, factor, factors)
    end
    factors
  end
end
