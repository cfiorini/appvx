class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|

      t.references :reseller, foreign_key:true

      t.integer :remote_id
      t.string :name
      t.integer :qty
      t.string :payment_method
      t.jsonb :accesses
      t.jsonb :response_credentials
      t.boolean :share_creds, default: false
      t.integer :branding_id
      t.decimal :total_price, precision: 12, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
