class AddProductsPurchasesTable < ActiveRecord::Migration
  def change
    create_table(:products_purchases) do |p|
      p.column(:purchase_id, :integer)
      p.column(:product_id, :integer)

      p.timestamps
    end
  end
end
