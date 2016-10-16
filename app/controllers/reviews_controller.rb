class ReviewsController < ApplicationController

def create
  puts "creating a review"
  @product = Product.find(params[:product_id])
  print @product
  puts "--------------"
  puts params
  @review = params[:review]
  @review['user_id'] = 'user id goes here'
  @review['product_id'] = params[:product_id]
  puts @review
  #@review.save()
end


end
