# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
Stock.delete_all
CSV.foreach("#{Rails.root}/db/o_test_data.csv", headers:true) do |row|
  Stock.create!(price: row['price'], date: row['date'], ticker: "O")
end

CSV.foreach("#{Rails.root}/db/sp500_test_data.csv", headers:true) do |row|
  Stock.create!(price: row['price'], date: row['date'], ticker: "sp500")
end


puts "#{Stock.all.count} stocks created"