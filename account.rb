# frozen_string_literal: true

class Account
  attr_reader :balance, :statement

  def initialize(balance = 0)
    @balance = balance
    @statement = {}
  end

  def credit(amount, date = Date.today)
    @balance += amount
    @statement.store(date, amount)
  end

  def debit(amount, date = Date.today)
    @balance -= amount
    @statement.store(date, -amount)
  end

end
