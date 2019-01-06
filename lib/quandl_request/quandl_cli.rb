require_relative 'quandl_request/request'

puts "Wilkommen zur HQ-Stock-Market App!"
# TODO investigate different databases and make them configurable
while true
  puts "Bitte geben Sie ein Aktienticker-Symbol ein"
  stock_ticker = gets.chomp
  # TODO validate name of stock ticker
  # TODO save stock ticker for next iteration and default to it
  puts "Bitte geben Sie ein Startdatum ein"
  start_date = gets.chomp
  # TODO suggest valid date ranges
  # TODO save dates for next iteration and default to it
  # TODO optional end date that defaults to today
  puts "Bitte geben Sie Ihre E-Mail-Adresse ein"
  email = gets.chomp # TODO do this only once


  request = Request.new(stock_ticker, start_date) # TODO this only once too
  request.get_data
  # TODO actually do something with the data
  puts "Um das Programm zu verlassen, geben Sie 'exit' ein"
  action = gets.chomp
  if action = "exit"
    puts "Goodbye"
    exit
  else

  end
  # TODO break on ctrl+c and print good bye message
end

# TODO write unit tests
# TODO write documentation, especially how to run



