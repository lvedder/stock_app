require 'net/smtp'
require 'mailjet'
require 'dotenv'

Dotenv.load('../.env')

Mailjet.configure do |config|
  config.api_key = ENV['MAILJET_API_KEY']
  config.secret_key = ENV['MAILJET_SECRET_KEY']
  config.default_from = ENV['EMAIL_ADDRESS']
end

email = {from_email: ENV['EMAIL_ADDRESS'],
         from_name: 'Lamina',
         subject: 'Hello',
         text_part: 'Hi',
         recipients: [{email: 'lamina-vedder@msn.com'}]}

test = Mailjet::Send.create(email)


p test.attributes['Sent']