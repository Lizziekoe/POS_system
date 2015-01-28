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
  product_price = params.fetch("product_price").to_i()
  product = Product.create({:name => product_name, :description => product_description, :price => product_price})
  redirect ("/")
end

get('/products/:id') do
  @product = Product.find(params.fetch("id").to_i())
  erb(:product)
end

patch('/product/:id') do
  product_name = params.fetch("product_name")
  product_price = params.fetch("product_price").to_i()
  product_description = params.fetch("product_description")
  @product = Product.find(params.fetch("id").to_i())
  @product.update({:name => product_name, :description => product_description, :price => product_price})
  erb(:product)
end

delete('/product_delete/:id') do
  @product = Product.find(params.fetch("id").to_i())
  @product.delete()
  @products = Product.all()
  erb(:index)
end

get('/customer') do
  @products = Product.all()
  erb(:customer)
end

post("/purchase") do
  product_ids = params.fetch("product_ids")
  new_array = []
  product_ids.each() do |id|
    new_array.push(id.to_i())
  end
  customer_name = params.fetch("customer")
  customer = Purchase.create({:customer => customer_name, :product_ids => new_array})
  redirect ("/")
end
