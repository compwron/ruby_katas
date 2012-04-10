require 'mathn'

class Primes
	def primes num
		num.prime? ? [num] : []
	end
end
