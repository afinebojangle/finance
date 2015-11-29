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
      sd = day - 30.days
      ed = day
      tick = @ticker
      dex = @index

      stocks = Stock.where{(date >= sd) & (date <= ed) & (ticker == tick)}.order(date: :asc).pluck(:price).to_vector
      
      indicies = Stock.where{(date >= sd) & (date <= ed) & (ticker == dex)}.order(date: :asc).pluck(:price).to_vector
      
      regression = Statsample::Regression::Simple.new_from_vectors(stocks, indicies)
      
      errors << regression.standard_error
    end

    errors

  end
  

end