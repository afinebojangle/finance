class Capm_regression
  include ActiveModel::Validations
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :ticker, :index, :start_date, :end_date

  validates :ticker, :index, :start_date, :end_date, presence: true

  def initialize(ticker, index, start_date, end_date)
    @ticker = ticker
    @index = index
    @start_date = start_date
    @end_date = end_date
  end

  def capm_regress

    errors = []

    days = @start_date.business_dates_until(@end_date.to_date)

    days.each do |day|
      puts "select ticker, price, date from table where date between #{day} and #{day-30.days}"
      puts "join #{@ticker} on #{@index}"
      puts "regress"
      error = {"#{day}": "error#{day}"}
      errors << error
    end

    errors

  end
  

end