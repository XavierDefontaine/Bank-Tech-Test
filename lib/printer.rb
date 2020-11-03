
module Printer

  def print_statement
    headers + formatter
  end

private 

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
end