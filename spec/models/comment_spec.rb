require 'rails_helper'

describe Comment do
  describe 'validations' do
    let(:user) { FactoryGirl.create(:user) }
    let(:product) { Product.create!(name: "race bike", description: "a perfect race bike", image_url: "1", colour: "red", price: 5) }

    it 'requires a user' do
      comment = Comment.new(user: user, product: product, rating: 3, body: 'test')
      expect(comment).to be_valid
      comment.user = nil
      expect(comment).not_to be_valid
    end

    it 'requires a product' do
      comment = Comment.new(user: user, product: product, rating: 3, body: 'test')
      expect(comment).to be_valid
      comment.product = nil
      expect(comment).not_to be_valid
    end

    it 'requires a rating' do
      comment = Comment.new(user: user, product: product, rating: 3, body: 'test')
      expect(comment).to be_valid
      comment.rating = nil
      expect(comment).not_to be_valid
    end

    it 'requires a body' do
      comment = Comment.new(user: user, product: product, rating: 3, body: 'test')
      expect(comment).to be_valid
      comment.body = nil
      expect(comment).not_to be_valid
    end
  end
end
