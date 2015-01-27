require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/product')
require('./lib/purchase')
require('pg')

get('/') do
  @products = Product.all()
  erb(:index)
end


post('/add_product') do
  product_name = params.fetch("product_name")
  product_description = params.fetch("product_description")
  product_price = params.fetch("product_price")
  product = Product.create({:name => product_name, :description => product_description, :price => product_price})
  redirect ("/")
end

get('/products/:id') do
  @product = Product.find(params.fetch("id").to_i())
  erb(:product)
end
