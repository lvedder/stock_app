class Return
  attr_reader :start_price, :end_price

  def initialize(start_price, end_price)
    @start_price = start_price
    @end_price = end_price
  end

  def return_on_investment
    calculation = @end_price - @start_price
    decimal_return = calculation / @start_price
    (decimal_return * 100).round(2)
  end

  def to_s
    "The return for your requested stock is: (#{return_on_investment} %)"
  end
end
