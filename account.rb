class Account 

  attr_reader :balance, :statement

  def initialize(balance = 0)
    @balance = balance
    @statement = Hash.new
  end
  
  def credit(amount, date = Date.today)
    @balance += amount
    @statement = Hash[date => amount]
  end

end