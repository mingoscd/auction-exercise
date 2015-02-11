class DefaultValueAmount < ActiveRecord::Migration
  def change
  	change_column :bids, :amount, :float, default: 0
  end
end
