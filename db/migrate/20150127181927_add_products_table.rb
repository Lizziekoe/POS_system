class AddProductsTable < ActiveRecord::Migration
  def change
    create_table(:products) do |t|
      t.column(:name, :string)
      t.column(:price, :integer)
      t.column(:description, :string)

      t.timestamps
    end
  end
end
