class RomanNumeral
  VALUE_MAPPER = {'M' => 1000, 'D' => 500, 'L' => 50, 'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1}
  
  def non_lookahead_convert letter, letter_value
    @@output += letter * (@@i / letter_value)
    @@i = @@i - (letter_value * (@@i  / letter_value))
  end

  def roman num
    @@output = ''
    @@i = num

    VALUE_MAPPER.each {|letter, letter_value| 
      non_lookahead_convert letter, letter_value
    }
    @@output
  end
end
