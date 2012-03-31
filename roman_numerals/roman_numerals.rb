class RomanNumeral
  def roman num
  	(num % 5 == 4) ? "I#{'V' * (num/5 + 1)}" : ('I' * num)
  end
end

