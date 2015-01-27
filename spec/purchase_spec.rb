require("spec_helper")

describe(Purchase) do

  it("tells which products have been purchased") do
    product1 = Product.create({:name => "apple", :price => 3, :description => "good"})
    product2 = Product.create({:name => "banana", :price => 2, :description => "great"})
    purchase1 = Purchase.create({:customer => "sally", :product_ids => [product1.id(), product2.id()]})
    expect(purchase1.products()).to(eq([product1, product2]))
  end
end
