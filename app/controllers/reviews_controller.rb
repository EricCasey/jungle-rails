class ReviewsController < ApplicationController

def index
  @review = Review.order(created_at: :desc)
end

def create
  @review = Review.new
  @review['description'] = params['review']['description']
  @review['rating'] = params['review']['rating']
  @review['product_id'] = params['product_id']
  @review['user_id'] = session[:user_id]
  @url = "/products/#{params['product_id']}"
  if @review.save
    redirect_to @url
  else
    redirect_to '/products/'
  end
end

def destroy
  @review = Review.find params[:id]
  @review.destroy
  # redirect_to product_review_remove_review_path
  redirect_to product_path(params[:product_id]), notice: 'Review gone!'
  # @url = "/products/#{params['product_id']}"
  # redirect_to @url
end

end
