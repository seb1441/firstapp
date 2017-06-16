require 'rails_helper'

describe ProductsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:product) { Product.create!(name: "race bike", description: "a perfect race bike", image_url: "1", colour: "red", price: 5) }

  before do
    sign_in user
  end

  context 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to render_template('index')
    end
  end

  describe "POST create" do
    it 'creates a product with valid attributes' do
      request.env['HTTP_REFERER'] = 'something'
      post :create, params: { product: { name: 'Test Product', description: 'Testing', image_url: 'test.jpg', colour: 'red', price: '100' } }
      expect(response).to redirect_to('something')

      product = Product.last
      expect(product).not_to be_nil
      expect(product.name).to eql('Test Product')
      expect(product.description).to eql('Testing')
      expect(product.image_url).to eql('test.jpg')
      expect(product.price).to eql(100)
    end

    it 'handles invalid attributes' do
      post :create, params: { product: { name: '' } }
      expect(response).to render_template('new')
    end
  end
end
