class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    @ratings = {}

    @products.each do |product|
      @ratings[product.id] = { average: product.reviews.average(:rating) , number: product.reviews.length }
    end
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: @product.id)
  end

end
