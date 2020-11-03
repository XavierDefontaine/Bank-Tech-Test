# frozen_string_literal: true

module Printer
  def print_statement
    headers + formatter
  end

  private

  def headers
    "date       || credit  || debit  || balance\n"
  end

  def formatter
    statement.reverse.map do |trx|
      trx[:date] + ' || ' +
        if trx[:credit].nil?
          "       || #{format('%.2f', trx[:debit].abs)} || "
        else "#{format('%.2f', trx[:credit].abs)} ||        || "
        end + format('%.2f', trx[:balance].abs).to_s
    end.join("\n")
  end
end
