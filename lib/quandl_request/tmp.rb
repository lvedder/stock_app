require_relative 'request'

request = Request.new('AAPL', '2018-03-27')

puts request.get_data