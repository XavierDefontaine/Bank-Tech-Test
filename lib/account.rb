# frozen_string_literal: true

require_relative 'printer'
require_relative 'transaction'

class Account
  attr_reader :balance, :statement

  # Printer is the extracted module to call print_statement
  include Printer

  def initialize(balance = 0, transaction = Transaction)
    @transaction = transaction
    @balance = balance
    @statement = []
  end

  def deposit(amount, date = Time.now)
    @balance += amount
    @statement << @transaction.new(date: date, credit: amount, balance: @balance)
  end

  def withdraw(amount, date = Time.now)
    raise 'Forget about it' if amount > @balance

    @balance -= amount
    @statement << @transaction.new(date: date, debit: -amount, balance: @balance)
  end
end
