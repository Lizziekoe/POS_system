class AddPurchasesTable < ActiveRecord::Migration
  def change
    create_table(:purchases) do |p|
      p.column(:customer, :string)

      p.timestamps
    end
  end
end
