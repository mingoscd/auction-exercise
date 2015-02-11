class BidsController < ApplicationController
	def new
		@users = User.all
		@item = Item.find params[:item_id]
		@bid = @item.bids.new
	end

	def create
		@item = Item.find params[:item_id]
		@bid = @item.bids.new bid_params
		if @bid.save
			redirect_to items_path()
		else
			render 'new'
		end
	end

	private

	def bid_params
		params.require(:bid).permit(:user_id, :item_id, :amount);
	end
end
