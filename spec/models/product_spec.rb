require 'rails_helper'

describe Product do
  before do
    @product = Product.create!(name: "race bike", description: "a perfect race bike", image_url: "1", colour: "red", price: 5)
    # @user = User.create!(email: "testRSPEC@gmail.com", password: "test11")
    @user = FactoryGirl.build(:user)
    @product.comments.create!(rating: 1, user: @user, body: "Terrible..")
    @product.comments.create!(rating: 3, user: @user, body: "Fine.")
    @product.comments.create!(rating: 5, user: @user, body: "Amazing!")
  end

  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq 3
  end

  it "is not valid" do
    expect(Product.new(description: "Nice Bike")).not_to be_valid
  end
end
