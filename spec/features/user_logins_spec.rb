require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    @user = User.create!({
      first_name: "Fritz",
      last_name: "Schnackenpfefferhausen",
      email: "mein@bratwurst.com",
      password: "fritz",
      password_confirmation: "fritz"
    })
  end

  scenario "They log in" do
    # ACT
    visit root_path
    find_link(href: "/login").click

    fill_in "email", with: "mein@bratwurst.com"
    fill_in "password", with: "fritz"
    find_button("Submit").click

    # VERIFY
    expect(page).to have_text "Hello, Fritz!"

    # DEBUG
    save_screenshot
  end

end
