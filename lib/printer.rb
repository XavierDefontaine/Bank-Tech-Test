# frozen_string_literal: true

module Printer
  def print_statement
    print headers + formatter
  end

  private

  def headers
    "date       || credit  || debit  || balance\n"
  end

  def formatter
    statement.reverse.map do |transaction|
      transaction.date + column +
        if transaction.credit.nil?
          blank_space + column + decimal_formatter(transaction.debit)
        else decimal_formatter(transaction.credit) + column + blank_space
        end + column + decimal_formatter(transaction.balance)
    end.join("\n")
  end

  def decimal_formatter(amount)
    format('%.2f', amount.abs)
  end

  def column
    ' || '
  end

  def blank_space
    '      '
  end
end
