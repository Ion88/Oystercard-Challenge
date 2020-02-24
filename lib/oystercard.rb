class Oystercard
  LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Maximum balance of #{LIMIT} exceeded" if @balance + money > LIMIT 
    @balance += money
  end


end
