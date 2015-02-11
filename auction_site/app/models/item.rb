class Item < ActiveRecord::Base
	has_many :bids
	has_many :users, through: :bids


	validates :name, presence: true, length: { maximum: 30 }
	validate :proper_date

	def assign_winner
		self.update_attribute :winner_id, self.bids.last.user_id
	end

	private

	def proper_date
		if expire_date < Date.today
			errors.add(:expire_date, "Wrong date")
		end
	end

end
