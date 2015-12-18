class Capm_regression
  include ActiveModel::Validations
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :ticker, :index, :start_date, :end_date

  validates :ticker, :index, :start_date, :end_date, presence: true

  # def initialize(ticker, index, start_date, end_date)
  #   @ticker = ticker
  #   @index = index
  #   @start_date = start_date
  #   @end_date = end_date
  # end

  def capm_regress
    
    start_date = Date.strptime("#{self.start_date}", '%Y-%m-%d')
    end_date = Date.strptime("#{self.end_date}", '%Y-%m-%d')
    tick = self.ticker
    dex = self.index
    
  
    errors = []
    prices = []
   # index_prices = []
    graph_data = []

    days = start_date.business_dates_until(end_date)

    days.each do |day|
      sd = day - 30.days
      ed = day
      
      stocks = Stock.where{(date >= sd) & (date <= ed) & (ticker == tick)}.order(date: :asc).pluck(:price).to_vector
      
      indicies = Stock.where{(date >= sd) & (date <= ed) & (ticker == dex)}.order(date: :asc).pluck(:price).to_vector
      
      regression = Statsample::Regression::Simple.new_from_vectors(stocks, indicies)
      
      price = Stock.where{(date == day) & (ticker == tick) }.pluck(:price)
      
     # index_price = Stock.where{(date == day) & (ticker == dex) }.pluck(:price)
      
      errors << [day, regression.standard_error]
      prices << [day, price[0]]
      #index_prices << [day, index_price[0]]
      
    end

    graph_data << { name: "errors", data: errors }
    graph_data << { name: "prices", data: prices }
    #graph_data << { name: "index", data: index_prices }
    
    graph_data

  end
  

end