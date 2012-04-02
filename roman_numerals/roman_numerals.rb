class RomanNumeral
  def roman num
    output = ''
    i = num
    if i / 1000 > 0
      output += ('M' * (i / 1000))
      i = i - (1000 * (i / 1000))
    end
    if i / 500 > 0
      output += ('D' * (i / 500))
      i = i - (500 * (i / 500))
    end
    if i / 50 > 0
      output += ('L' * (i / 50))
      i = i - (50 * (i / 50))
    end
    if i / 10 > 0
      output += ('X' * (i / 10))
      i = i - (10 * (i / 10))
    end
    if i / 5 > 0
      output += ('V' * (i / 5))
      i = i - (5 * (i / 5))
    end
    output
  end
end

