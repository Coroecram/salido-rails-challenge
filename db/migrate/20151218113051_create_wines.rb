class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.string :url
      t.decimal :min_price
      t.decimal :max_price
      t.decimal :retail_price
      t.string :type
      t.string :year

      t.timestamps null: false
    end
    add_index :wines, :name
    add_index :wines, :year
    add_index :wines, :type
    add_index :wines, :min_price
    add_index :wines, :max_price
    add_index :wines, :retail_price
  end
end
