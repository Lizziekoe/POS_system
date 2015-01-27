require('spec_helper')

describe(Product) do
  it("list out all the instances that the product has been purchased") do
    purchase1 = Purchase.create({:customer => "sally"})
    purchase2 = Purchase.create({:customer => "sam"})
    product1 = Product.create({:name => "apple", :price => 3, :description => "good", :purchase_ids => [purchase1.id, purchase2.id]})
    expect(product1.purchases()).to(eq([purchase1, purchase2]))
  end
end
