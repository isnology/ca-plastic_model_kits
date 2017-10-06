class ChangePriceColumnToInteger < ActiveRecord::Migration[5.1]
  def up
    change_column :kits, :price, :integer
  end
  
  def down
    change_column :kits, :price, :decimal, precision: 7, scale: 2
  end
end
