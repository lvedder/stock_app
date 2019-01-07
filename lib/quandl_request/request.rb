require 'date'
require 'dotenv'
require 'quandl'

Dotenv.load('../.env')

class Request
  attr_reader :stock_ticker, :start_date

  def initialize(stock_ticker, start_date, end_date = Date.today.to_s)
    Quandl::ApiConfig.api_version = ENV['QUANDL_API_VERSION']
    Quandl::ApiConfig.api_key = ENV['QUANDL_API_KEY']

    @stock_ticker = stock_ticker
    @start_date = start_date
    @end_date = end_date
  end

  def get_data
    start_date = @start_date
    stock_ticker = @stock_ticker
    end_date = @end_date
    params = {limit: 1, start_date: start_date, end_date: end_date}
    data = Quandl::Dataset.get("WIKI/#{stock_ticker}").data(params: params).first
    # TODO if-else-statements to display error messages in case API connection fails/calls per day exceeded
    return data
  end
end
