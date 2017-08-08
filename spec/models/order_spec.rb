require 'rails_helper'

RSpec.describe Order, type: :model do
describe 'After creation' do
    before :each do

      # Setup at least two products with different quantities, names, etc
      @category = Category.new(name: "Awesome")
      @product1 = Product.create!(
        name: "Awesome thing",
        price: 100,
        quantity: 2,
        category: @category
        )
      @product2 = Product.create!(
        name: "Awesomer thing",
        price: 200,
        quantity: 8,
        category: @category)

      # Setup at least one product that will NOT be in the order
      @product3 = Product.create!(
        name: "Awesomest thing",
        price: 1234,
        quantity: 8,
        category: @category)

    end

    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        total_cents: 0,
        stripe_charge_id: "ch_1AoKKhAxhn4GLds7Fi43w1jm",
        email: "abc@def.com"
        )
      # 2. build line items on @order
      quantity1 = 1
      @order.line_items.new(
          product: @product1,
          quantity: quantity1,
          item_price: @product1.price,
          total_price: @product1.price * quantity1
        )

      quantity2 = 4
      @order.line_items.new(
          product: @product2,
          quantity: quantity2,
          item_price: @product2.price,
          total_price: @product2.price * quantity2
        )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.refresh(-quantity1)
      @product2.refresh(-quantity2)
      # 5. use RSpec expect syntax to assert their new quantity values

      expect(@product1.quantity).to eq 1
      expect(@product2.quantity).to eq 4
    end

    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        total_cents: 0,
        stripe_charge_id: "ch_1AoKKhAxhn4GLds7Fi43w1jm",
        email: "abc@def.com"
        )
      # 2. build line items on @order
      quantity1 = 1
      @order.line_items.new(
          product: @product1,
          quantity: quantity1,
          item_price: @product1.price,
          total_price: @product1.price * quantity1
        )

      quantity2 = 4
      @order.line_items.new(
          product: @product2,
          quantity: quantity2,
          item_price: @product2.price,
          total_price: @product2.price * quantity2
        )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.refresh(-quantity1)
      @product2.refresh(-quantity2)
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product3.quantity).to eq 8
    end
  end
end
