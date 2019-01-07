require_relative 'quandl_request/request'
require_relative 'mail'

puts 'Welcome to your stock market app! This app will provide you with data about the return and maximum drawdown of your requested stock ticker'
# TODO investigate different databases and make them configurable
until false
  puts 'Please enter a stock ticker symbol'
  stock_ticker = gets.chomp
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
  puts 'Please provide your email-address'
  @email = gets.chomp.to_s
  mailer = Mailjet::Send.create(@email)
  mailer.attributes['Sent']


  request = Request.new(stock_ticker, start_date)
  request.get_data
  # TODO actually do something with the data

  puts 'Do you want to enter more? y/n'
  answer = gets.chomp
  if answer == 'n'
    puts "Goodbye!"
    break
  end
end

# TODO write unit tests



