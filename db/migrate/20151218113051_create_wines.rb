class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.string :url
      t.decimal :pricemin
      t.decimal :pricemax
      t.decimal :priceretail
      t.string :type
      t.string :year

      t.timestamps null: false
    end
  end
end
