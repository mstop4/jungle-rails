class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)

    @ratings = {}

    @products.each do |product|
      @ratings[product.id] = { average: product.reviews.average(:rating) , number: product.reviews.length }
    end
  end

end
