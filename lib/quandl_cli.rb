require_relative 'quandl_request/request'
require_relative '../lib/mail'
require_relative 'quandl_request/return'

puts 'Welcome to your stock market app! This app will provide you with data about the return and maximum drawdown of your requested stock ticker'
# TODO investigate different databases and make them configurable
while true
  puts 'Please enter a stock ticker symbol'
  stock_ticker = gets.chomp.upcase
  # TODO validate name of stock ticker
  # TODO save stock ticker for next iteration and default to it

  puts "Please enter a start date 'yyyy-mm-dd' to calculate the maximum drawdown and return from start date to today."
  start_date = gets.chomp
  if start_date =~ /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/
    puts "This is a valid start date"
  else
    puts "Please make sure you enter the start_date correctly"
  end
  # TODO suggest valid date ranges
  # TODO save start date for next iteration and default to it
  # TODO optional end date that defaults to today?


  request = Request.new(stock_ticker, start_date)
  new_data = request.get_data
  end_price = new_data.first["adj_close"]
  start_price = new_data.last["adj_close"]
  p start_price
  p end_price
  roi = Return.new(start_price, end_price)
  roi.return_on_investment
  p roi.to_s

  puts 'Please provide your email-address'
  customer_email = gets.chomp.to_s
  Mail.new(customer_email, roi, stock_ticker)

  # TODO actually do something with the data

  puts 'Do you want to enter more? y/n'
  answer = gets.chomp
  if answer == 'n'
    puts "Goodbye!"
    break
  end
end

# TODO write unit tests
