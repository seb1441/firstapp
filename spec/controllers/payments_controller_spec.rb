require 'rails_helper'

describe PaymentsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:product) { Product.create!(name: "race bike", description: "a perfect race bike", image_url: "1", colour: "red", price: 5) }

  before do
    sign_in user
  end

  describe "POST create" do
    it "creates an order" do
      mock_charge = double(paid: true)
      expect(Stripe::Charge).to receive(:create).and_return(mock_charge)

      expect {
        post :create, params: { product_id: product.id, stripeToken: '123abc', stripeEmail: 'test@test.com' }
      }.to change { ActionMailer::Base.deliveries.count }.from(0).to(1)

      expect(response).to redirect_to(product_path(product))

      order = Order.last
      expect(order.user).to eql(user)
      expect(order.product).to eql(product)
      expect(order.total).to eql(product.price.to_f)

      email = ActionMailer::Base.deliveries.last
      expect(email.subject).to eql('Order Confirmation - Bike Shop!')
      expect(email.to[0]).to eql(user.email)
      expect(email.body.to_s).to include(product.name)
    end

    it "handles failed charges" do
      mock_charge = double(paid: false)
      expect(Stripe::Charge).to receive(:create).and_return(mock_charge)

      expect {
        post :create, params: { product_id: product.id, stripeToken: '123abc', stripeEmail: 'test@test.com' }
      }.not_to change { ActionMailer::Base.deliveries.count }

      expect(response).to redirect_to(product_path(product))

      order = Order.last
      expect(order).to be_nil
    end
  end
end
