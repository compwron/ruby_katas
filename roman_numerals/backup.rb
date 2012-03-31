class RomanNumeral
  # def roman num
  #   (num % 5 == 4) ? "I#{'V' * (num/5 + 1)}" : (num % 5 == 0) ? 'V' * (num/5) 
  #   : (num % 5 == 1) ? ('V' * (num/5) + ('I' * (num % 5))) : 'error'
  # end

  # private

  def roman num
    if ends_in_4? num 
      result_for_ends_in_4 num 
    # elsif divisible_by_5? num 
    #   result_for_divisible_by_5
    # end
    else
      result_for_ends_between_five_and_nine_exclusive num
    end
  end

  def roman2 num
    ('X' * (num/10)) + ('V' * (num/5)) + ('I' * (num % 5))
  end

  def ends_between_five_and_nine_exclusive num
    remainder = (num % 5)
    in_range = (0 < remainder && remainder < 4)
    in_range
  end

  def result_for_ends_between_five_and_nine_exclusive num
    'V' * (num/5) + ('I' * (num % 5))
  end

  private

  def one_less_than_five num
    num % 5 == 4
  end

  def ends_in_4? num
    num % 5 == 4
  end

  def result_for_ends_in_4 num
    "I#{'V' * (num/5 + 1)}"
  end

  def divisible_by_5? num
    num % 5 == 0
  end

  def result_for_divisible_by_5 num # will change later
    'V' * (num/5)
  end




end

