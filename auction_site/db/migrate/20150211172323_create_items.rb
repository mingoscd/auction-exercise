class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :seller_id
      t.integer :winner_id
      t.date :expire_date
      t.float :last_bid
      t.timestamps null: false
    end
  end
end
