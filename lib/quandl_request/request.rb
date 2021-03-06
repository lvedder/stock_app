require 'date'
require 'dotenv'
require 'quandl'
# require_relative 'result'

Dotenv.load

class Request
  attr_reader :stock_ticker, :start_date
  attr_accessor :end_date

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
    params = {start_date: start_date, end_date: end_date}
    Quandl::Dataset.get("EOD/#{stock_ticker}").data(params: params)
    # TODO if-else-statements to display error messages in case API connection fails/calls per day exceeded
  end

  def result

  end
end