class Bid < ActiveRecord::Base
	belongs_to :item
	belongs_to :user

	validate :proper_amount

	private

	def proper_amount
		if Item.find(item_id).bids.any?
		 	last_bid = Item.find(item_id).bids.last.amount
		else
			last_bid = 0
		end

		if amount <= last_bid
			errors.add(:amount, "New bids have to be higher than the last bid accepted")
		end
	end
end
