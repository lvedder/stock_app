require_relative 'request'

class Drawdown
  attr_reader :peak, :trough
  def initialize(peak, trough)

  end

  def calculate_drawdown
    (trough.low.to_f - peak.high.to_f) / peak.high.to_f
  end

  def output
    puts "#{(calculate_drawdown * 100).round(2)}%"
  end
end