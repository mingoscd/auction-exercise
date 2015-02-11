class Bid < ActiveRecord::Base
	belongs_to :item
	belongs_to :user

	validate :proper_amount

	private

	def proper_amount
		last_bid = Item.find(item_id).bids.last.amount

		if amount <= last_bid
			errors.add(:amount, "New bids have to be higher than the last bid accepted")
		end
	end
end
