require_relative 'request'

class Return
  attr_reader :stock_ticker, :start_date

  def initialize(stock_ticker, start_date)
    @stock_ticker = stock_ticker
    @start_date = start_date
    request = Request.new(@stock_ticker, @start_date)
    data = request.get_data(@stock_ticker, @start_date)
    @start_price = data.open
    @end_price = data.close
  end

  def return_on_investment
    calculation = @end_price - @start_price
    decimal_return = calculation / @start_price
    percentage = (decimal_return * 100).round(2)
    return percentage
  end

  def difference
    "#{return_on_investment.calculation} [#{'+' if return_on_investment.calculation > 0}#{return_on_investment}%] (#{@start_price} on #{@start_date.strftime("%d.%m.%y")} -> #{@end_price} on #{Date.today.strftime("%d.%m.%y")})"
  end

end