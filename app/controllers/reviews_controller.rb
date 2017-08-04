class ReviewsController < ApplicationController

  before_filter :login_required

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user_id = current_user.id

    if @review.save
      redirect_to controller: 'products', action: 'show', id: params[:product_id], notice: "OK"
    else
      redirect_to controller: 'products', action: 'show', id: params[:product_id], notice: "Nope"
    end
  end

  private
    def login_required
      redirect_to controller: 'products', action: 'show', id: params[:product_id], notice: "Nope" if current_user == nil
    end

    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
