require_relative '../../lib/quandl_request/request'

describe Drawdown do
  let(:peak)     { Request.new("AAPL", "2018-12-31").get_data.low }
  let(:trough)   { Request.new("AAPL", "2018-12-31").get_data.high }
  let(:drawdown) { Drawdown.new(peak, trough).calculate_drawdown }

  it "calculates percentage of maximum drawdown" do
    expect(drawdown.to_f).to eq -0.08080489 # (145.72 - 158.53)/158.53
  end

  it "formats string" do
    expect(drawdown.to_s).to eq "Maximum Drawdown: -8.08%"
  end
end