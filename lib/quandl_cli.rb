# require_relative 'quandl_request/request'
# require_relative '../lib/mail'
require 'quandl'
require 'dotenv'
require 'mailjet'

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
    data = Quandl::Dataset.get("EOD/#{stock_ticker}").data(params: params)
    p data
    # TODO if-else-statements to display error messages in case API connection fails/calls per day exceeded
    data
  end

  def return
    unless get_data.nil?
      Return.new(get_data.open, get_data.close)
    end
  end

  def return_on_investment(start_price, end_price)
    calculation = end_price - start_price
    decimal_return = calculation / start_price
    (decimal_return * 100).round(2)
  end


  def result
    unless get_data.nil?
      Result.new(get_data)
    end
  end
end

class Mail
  attr_accessor :customer_email

  def initialize(customer_email)
    customer_email = customer_email
    p ENV
    Mailjet.configure do |config|
      config.api_key = ENV['MAILJET_API_KEY']
      config.secret_key = ENV['MAILJET_SECRET_KEY']
      config.default_from = ENV['EMAIL_ADDRESS']
    end

    send_email(customer_email)
  end

  def send_email(recipient)
    email = { from_email: ENV['EMAIL_ADDRESS'],
              from_name: 'Lamina',
              subject: 'HQ Stock Market App: Your request results',
              text_part: 'Hi',
              recipients: [{email: recipient}]}

    test = Mailjet::Send.create(email)

    p test.attributes['Sent']
  end
end


puts 'Welcome to your stock market app! This app will provide you with data about the return and maximum drawdown of your requested stock ticker'
# TODO investigate different databases and make them configurable
while true
  puts 'Please enter a stock ticker symbol'
  stock_ticker = gets.chomp.upcase
  # TODO validate name of stock ticker
  # TODO save stock ticker for next iteration and default to it

  puts "Please enter a start date 'yyyy-mm-dd' to calculate the maximum drawdown and return from start date to today."
  start_date = gets.chomp
  if (start_date =~ /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/)
    puts "This is a valid start date"
  else
    puts "Please make sure you enter the start_date correctly"
  end
  # TODO suggest valid date ranges
  # TODO save start date for next iteration and default to it
  # TODO optional end date that defaults to today?
  puts 'Please provide your email-address'
  customer_email = gets.chomp.to_s
  # Mail.new(customer_email)


  request = Request.new(stock_ticker, start_date)
  new_data = request.get_data
  end_price = new_data.first["adj_close"]
  start_price = new_data.last["adj_close"]
  p start_price
  p end_price

  p request.return_on_investment(start_price, end_price)


  # TODO actually do something with the data

  puts 'Do you want to enter more? y/n'
  answer = gets.chomp
  if answer == 'n'
    puts "Goodbye!"
    break
  end
end

# TODO write unit tests



