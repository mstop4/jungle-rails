require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'should have everything and be valid' do
      @category = Category.new(name: "Awesome")
      @product = Product.new(
        name: "Awesome thing",
        price: 100000,
        quantity: 2,
        category: @category
        )

      expect(@product.valid?).to be_true, @product.errors.full_messages.to_sentence
    end

    it 'is missing a name and should be invalid' do
      @category = Category.new(name: "Awesome")
      @product = Product.new(
        price: 100000,
        quantity: 2,
        category: @category
        )

      expect(@product.valid?).to be_true, @product.errors.full_messages.to_sentence
    end

    it 'is missing the price and should be invalid' do
      @category = Category.new(name: "Awesome")
      @product = Product.new(
        name: "Awesome thing",
        quantity: 2,
        category: @category
        )

      expect(@product.valid?).to be_true, @product.errors.full_messages.to_sentence
    end

    it 'is missing a quantity and should be invalid' do
      @category = Category.new(name: "Awesome")
      @product = Product.new(
        name: "Awesome thing",
        price: 100000,
        category: @category
        )

      expect(@product.valid?).to be_true, @product.errors.full_messages.to_sentence
    end

    it 'is missing a category and should be invalid' do
      @product = Product.new(
        name: "Awesome thing",
        price: 100000,
        quantity: 2,
        )

      expect(@product.valid?).to be_true, @product.errors.full_messages.to_sentence
    end
  end
end
