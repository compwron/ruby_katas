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
    output
  end
end

