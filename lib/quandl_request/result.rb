require_relative 'return'
require_relative 'drawdown'
require_relative '../../lib/quandl_cli'

class Result
  class Result
    Data = Struct.new(:ticker, :date, :open, :high, :low, :close, :volume, :ex_dividend, :split_ratio, :adj_open, :adj_high, :adj_low, :adj_close, :adj_volume)

    def initialize(request)

    end

    def maximum_drawdown
      Drawdown.new()
    end

    def return
      Return.new()
    end
  end