require 'rails_helper'

describe ProductsController, type: :controller do

  context 'GET #index' do
    before do
      get :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      # expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  let(:user) { FactoryGirl.create(:user) }
  let(:product) { Product.create!(name: "race bike", description: "a perfect race bike", image_url: "1", colour: "red", price: 5) }

  before do
    sign_in user
  end

  describe "POST create" do
    it 'creates a product with valid attributes' do
      post products_path, params: { name: 'Test Product', description: 'Testing', image_url: 'test.jpg', colour: 'red', price: '100' }
      expect(response).to redirect_to(:back)

      product = Product.last
      expect(product).not_to be_nil
      expect(product.name).to eql('Test Product')
      expect(product.description).to eql('Testing')
      expect(product.image_url).to eql('test.jpg')
      expect(product.price).to eql(100)
    end

    it 'handles invalid attributes' do
      post products_path, params: {}
      expect(response).to render_template('new')
    end
  end
end
