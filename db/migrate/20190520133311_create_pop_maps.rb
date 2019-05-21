class CreatePopMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :pop_maps do |t|

      t.references :location, foreign_key:true

      t.string :name
      t.string :public_name
      t.string :pm_type
      t.boolean :autoplay, default: false
      t.decimal :price, precision: 12, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
