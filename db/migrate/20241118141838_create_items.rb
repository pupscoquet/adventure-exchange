class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.string :description
      t.float :price_per_day
      t.string :location

      t.timestamps
    end
  end
end
