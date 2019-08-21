require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    it "is valid with a email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a password that hasn't Alpanumeric mixed" do
      user = build(:user, password: "abcdefgh", password_confirmation: "abcdefgh")
      user.valid?
      expect(user.errors[:password][0]).to include("doesn't Alphanumeric mixed")
    end

    it "is invalid with a password that has less than 7 characters" do
      user = build(:user, password: "000aaa", password_confirmation: "000aaa")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end
