require_relative "../primes.rb"

describe Primes do

  subject { Primes.new }

  it "primes of 1" do
    subject.primes(1).should == []
  end
end
