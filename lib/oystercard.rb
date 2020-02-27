class Oystercard
  LIMIT = 90
  MINIMUM = 1
  MINIMUM_CHARGE = 4

  attr_reader :balance
  attr_reader :entry_station

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    fail "Maximum balance of #{LIMIT} exceeded" if @balance + money > LIMIT
    @balance += money
  end

  def touch_in(station)
    fail "There is not enough money on your card" if @balance < MINIMUM
    @entry_station = station
  end

  def touch_out
    puts "You have now #{deduct}£ left on your card"
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end


  private

  def deduct
    @balance -= MINIMUM_CHARGE
  end


end
