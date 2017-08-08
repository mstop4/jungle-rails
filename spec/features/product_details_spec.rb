require 'rails_helper'

RSpec.feature "Visitor looks at a product", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the details of a product" do
    # ACT
    visit root_path
    find_link("Details »", href: "/products/5").click

    # VERIFY
    expect(page).to have_css '.products-show'

    # DEBUG
    save_screenshot
  end
end
