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
    raise 'Forget about it' if amount > @balance

    @balance -= amount.round(2)
    @statement.store(date, [-amount, balance])
  end

  def headers
    "date       || credit  || debit  || balance\n"
  end

  def formatter
    statement.to_a.reverse.map do |trx|
      trx[0] + ' || ' +
        if (trx[1][0]).negative?
          "       || #{format('%.2f', trx[1][0].abs)} || "
        else "#{format('%.2f', trx[1][0].abs)} ||        || "
        end + format('%.2f', trx[1][1].abs).to_s
    end.join("\n")
  end

  def print
    headers + formatter
  end
end
