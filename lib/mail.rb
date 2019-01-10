require 'net/smtp'
require 'mailjet'
require 'dotenv'

Dotenv.load

class Mail

  def initialize(customer_email, roi, stock_ticker)
    customer_email = customer_email
    @roi = roi
    @stock_ticker = stock_ticker
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
              text_part: "You requested data for the #{@stock_ticker} stock ticker symbol: #{@roi}.",
              recipients: [{email: recipient}]}

    test = Mailjet::Send.create(email)

    p test.attributes['Sent']
  end
end
