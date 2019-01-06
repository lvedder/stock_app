## Stock App

A stock app which can be interacted with through the command line.
The application will accept **two inputs**, a **stock ticker**, e.g. 'AAPL' 
and a **start date** '2018-01-01'. Based on the input, the application will 
calculate the **return** and the **maximum drawdown** since
the start date up to today. The result of the calculation will be 
send to the user via **email**. 

The **Quandl's Wiki** [EOD Stock Prices](https://www.quandl.com/data/WIKI)
was used as an input for financial data.

## Setup

To run the application please run the following instructions in your terminal:

```ruby
  bundle install
```

## Usage

In order to make your application work, you will need a **Mailjet API** and a 
**Quandl API**. Therefore, please create an account on [Mailjet](https://app.mailjet.com/)
and [Quandl](https://www.quandl.com/).

Once you have access to your Quandl API keys and Mailjet API keys, please insert them
to the corresponding variables in the '.env' file. 

``` ruby
MAILJET_API_KEY=
MAILJET_SECRET_KEY=
EMAIL_ADDRESS=
QUANDL_API_KEY=
QUANDL_API_VERSION=
```

Please do not change the variable names as they will be referred to in other files holding code.

Now, you are all set to run the application! 

Type in the following command to run your application in your terminal:

``` ruby
ruby lib/quandl_cli.rb
```

