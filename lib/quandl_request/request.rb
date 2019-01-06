require 'date'
require 'dotenv'
require 'quandl'

Dotenv.load('../.env')

class Request
  attr_reader :stock_ticker, :start_date

  def initialize(stock_ticker, start_date)
    Quandl::ApiConfig.api_version = ENV['QUANDL_API_VERSION']
    Quandl::ApiConfig.api_key = ENV['QUANDL_API_KEY']

    @stock_ticker = stock_ticker
    @start_date = start_date
  end

  def get_data
    start_date = @start_date
    stock_ticker = @stock_ticker
    params = {limit: 1, start_date: start_date, end_date: Date.today.to_s}
    data = Quandl::Dataset.get("WIKI/#{stock_ticker}").data(params: params).first
    # TODO if-else-statements to display error messages in case API connection fails
    return data
  end
end
