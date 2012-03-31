class FizzBuzz
  def evaluate num
    (num % 3 == 0) ? 'fizz' : (num % 5 == 0) ? 'buzz' : num
  end
end
