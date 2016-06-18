# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

products_data = ActiveSupport::JSON.decode(File.read( "#{File.dirname(__FILE__)}/products.json"))

products_data['products'].each do |product|
	Product.create!(product)
end

