class ReviewsController < ApplicationController

  before_filter :login_required

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user_id = current_user.id

    if @review.save
      redirect_to product_path(params[:product_id]), notice: "Review Posted"
    else
      redirect_to product_path(params[:product_id]), notice: "Review Failed"
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(params[:product_id]), notice: "Review Deleted"
  end

  private
    def login_required
      redirect_to product_path(params[:product_id]), notice: "Not logged in" if current_user == nil
    end

    def review_params
      params.require(:review).permit(:description, :rating)
    end
end