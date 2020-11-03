# frozen_string_literal: true

class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(date:, credit: nil, debit: nil, balance:)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end
end
