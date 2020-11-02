# frozen_string_literal: true
require 'date'

class Account
  attr_reader :balance, :statement

  def initialize(balance = 0)
    @balance = balance
    @statement = {}
  end

  def deposit(amount, date = Date.today)
    @balance += amount.round(2)
    @statement.store(date, [amount, balance])
  end

  def withdraw(amount, date = Date.today)
    raise "Forget about it" if amount > @balance 
    @balance -= amount.round(2)
    @statement.store(date, [-amount, balance])
  end

  def headers
    "date       || credit  || debit  || balance\n" 
  end

  def formatter
  statement.to_a.reverse.map {|trx| trx[0] + " || "  + 
  if trx[1][0] < 0 
    "      " + " || "  + sprintf('%.2f', trx[1][0].abs).to_s + " || "
  else sprintf('%.2f', trx[1][0].abs).to_s + " || " + "      " + " || "
  end + sprintf('%.2f', trx[1][1].abs).to_s
  }.join("\n")
  end

  def print
   return headers + formatter
  end
end