class CreateKits < ActiveRecord::Migration[5.1]
  def change
    create_table :kits do |t|
      t.string :name
      t.string :brand
      t.string :scale
      t.string :subject
      t.decimal :price, precision: 7, scale: 2

      t.timestamps
    end
  end
end
