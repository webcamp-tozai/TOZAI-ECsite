class ItemReviewsController < ApplicationController
	def index
	end

	def new
	end

	def edit
	end

	def update
	end

	def create
	end

	def destroy
	end
private
def item_reviews_params
	params.require(:item_reviews).permit(:user_id,:item_id,:review)
end
