# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.destroy_all
ShoppingCart.destroy_all
ShoppingCartItem.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

def random_product
  {
    title: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    available_inventory: rand(0..10)
  }
end

50.times { Product.create(random_product) }
