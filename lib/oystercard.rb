class Oystercard
  LIMIT = 90
  MINIMUM = 1
  MINIMUM_CHARGE = 4

  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    fail "Maximum balance of #{LIMIT} exceeded" if @balance + money > LIMIT
    @balance += money
  end

  def touch_in
    fail "There is not enough money on your card" if @balance < MINIMUM
    @in_journey = true
  end

  def touch_out
    puts "You have now #{deduct}£ left on your card"
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct
    @balance -= MINIMUM_CHARGE
  end


end
