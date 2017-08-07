require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'should have everything and be valid' do
      @user = User.new(
        first_name: "Homer",
        last_name: "Homer",
        email: "my@bologna.com",
        password: "smrt",
        password_confirmation: "smrt"
        )

      expect(@user.valid?).to be(true), @user.errors.full_messages.to_sentence
    end

    it "passwords don\'t match and should be invalid" do
      @user = User.new(
        first_name: "Homer",
        last_name: "Homer",
        email: "my@bologna.com",
        password: "smrt",
        password_confirmation: "smart"
        )

      expect(@user.valid?).to be(true), @user.errors.full_messages.to_sentence
    end

    it "no first name, should be invalid" do
      @user = User.new(
        last_name: "Homer",
        email: "my@bologna.com",
        password: "smrt",
        password_confirmation: "smrt"
        )

      expect(@user.valid?).to be(true), @user.errors.full_messages.to_sentence
    end

    it "no last name, should be invalid" do
      @user = User.new(
        first_name: "Homer",
        email: "my@bologna.com",
        password: "smrt",
        password_confirmation: "smrt"
        )

      expect(@user.valid?).to be(true), @user.errors.full_messages.to_sentence
    end

    it "no email, should be invalid" do
      @user = User.new(
        first_name: "Homer",
        last_name: "Homer",
        password: "smrt",
        password_confirmation: "smrt"
        )

      expect(@user.valid?).to be(true), @user.errors.full_messages.to_sentence
    end

    it "no password, should be invalid" do
      @user = User.new(
        first_name: "Homer",
        last_name: "Homer",
        email: "my@bologna.com",
        password_confirmation: "smrt"
        )

      expect(@user.valid?).to be(true), @user.errors.full_messages.to_sentence
    end

    it "no password confirmation, should be invalid" do
      @user = User.new(
        first_name: "Homer",
        last_name: "Homer",
        email: "my@bologna.com",
        password: "smrt",
        )

      expect(@user.valid?).to be(true), @user.errors.full_messages.to_sentence
    end

    it "password too short, should be invalid" do
      @user = User.new(
        first_name: "Homer",
        last_name: "Homer",
        email: "my@bologna.com",
        password: "hmr",
        password_confirmation: "hmr"
        )

      expect(@user.valid?).to be(true), @user.errors.full_messages.to_sentence
    end

  end

  describe '.authenticate_with_credentials' do

    before(:all) do
      @account = User.new(
        first_name: "Homer",
        last_name: "Homer",
        email: "my@bologna.com",
        password: "smrt",
        password_confirmation: "smrt"
        )
      @account.save!
    end

    it "should log in fine" do
      @user = authenticate_with_credentials("my@bologna.com", "smrt")

      expect(@user).to_not be nil, "Oops, you broke it"
    end
  end
end
