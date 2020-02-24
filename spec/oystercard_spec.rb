require 'oystercard'

describe Oystercard do

  it 'has default balance of 0' do
    expect(subject.balance).to eq 0
  end

 describe '#top_up' do
  it 'can be top up with the amount' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it 'can add money to card' do
    subject.top_up(5)
    expect(subject.balance).to eq 5
  end

  it 'raises an error when you top up £95' do
    maximum_balance = Oystercard::LIMIT
    subject.top_up maximum_balance
    expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end
 end


end
