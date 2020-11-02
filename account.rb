class Account 

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end
  
  def credit(amount, date = Date.now)
    @balance += amount
  end

end