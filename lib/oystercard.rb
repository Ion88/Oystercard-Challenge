class Oystercard
  LIMIT = 90
  MINIMUM = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    fail "Maximum balance of #{LIMIT} exceeded" if @balance + money > LIMIT
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
    fail "There is not enough money on your card" if @balance < MINIMUM
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end


end
