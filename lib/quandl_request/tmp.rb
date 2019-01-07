require_relative 'request'
require_relative '../../lib/mail'


mail = Mail.new("lamina-vedder@msn.com")
mail.send_email


p test.attributes['Sent']

request = Request.new('AAPL', '2018-03-27')

puts request.get_data