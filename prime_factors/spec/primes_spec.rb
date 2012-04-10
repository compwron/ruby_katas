require_relative "../primes.rb"

describe Primes do

  subject { Primes.new }

  it "primes" do
    prime_factors = {1 => [], 2 => [2], 3 => [3]}
    1.upto(3).each do |i|
      subject.primes(i).should == prime_factors[i]
    end
  end
end
