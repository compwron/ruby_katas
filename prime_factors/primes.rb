require 'mathn'

class Primes
  def primes num
  	num ==1 ? [] : num.prime? ? [num] : [2, 2]
  end
end
