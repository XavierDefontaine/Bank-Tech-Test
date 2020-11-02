# frozen_string_literal: true
require 'date'

class Account
  attr_reader :balance, :statement

  def initialize(balance = 0)
    @balance = balance
    @statement = {}
  end

  def deposit(amount, date = Date.today)
    @balance += amount.round(3)
    @statement.store(date, [amount, balance])
  end

  def withdraw(amount, date = Date.today)
    raise if amount > @balance 
    @balance -= amount.round(2)
    @statement.store(date, [-amount, balance])
  end

  def headers
    "date || credit || debit || balance" 
  end

  def print
  statement.to_a.map {|trx| trx[0] + " || "  + sprintf('%.2f', trx[1][0].abs).to_s + " || " + "      " + " || " + sprintf('%.2f', trx[1][1].abs).reverse.to_s 
   }[0]
  end
end