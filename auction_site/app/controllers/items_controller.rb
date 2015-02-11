class ItemsController < ApplicationController
	def index
		@items = Item.all.where("expire_date > ?", Date.today) 
		@users = User.all
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new item_params
		if @item.save
			redirect_to items_path()
		else
			render 'new'
		end
	end

	private

	def item_params
		params.require(:item).permit(:name, :description, :expire_date);
	end
end
