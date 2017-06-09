# require 'rails_helper'
#
# describe PaymentsController, type: :controller do
#   let(:user) { FactoryGirl.create(:user) }
#   # Comment.new(user: user, product: product, rating: 3, body: 'test')
#   let(:product) { Product.create!(name: "race bike", description: "a perfect race bike", image_url: "1", colour: "red", price: 5) }
#
#   before do
#     sign_in user
#   end
#
#   describe "POST create" do
#     it "sends an email" do
#       post '/payments/create', params: { product_id: product.id, stripeToken: '123abc', stripeEmail: 'test@test.com' }
#       # expect(response).to change { ActionMailer::Base.deliveries.count }.from(0).to(1)
#     end
#
#     # expect(response).to redirect_to(product_path(product))
#
#     # order = Order.last
#     # it "is not valid" do
#     #   expect(order).not_to be_nil
#     # end
#
#     # expect(order.user).to eql(user)
#     # expect(order.product).to eql(product)
#     # expect(order.total).to eql(product.price)
#     #
#     # email = ActionMailer::Base.deliveries.last
#     #
#     # expect(email.subject).to eql('Order Confirmation - Bike Shop!')
#     # expect(email.to[0]).to eql(user.email)
#     # expect(email.body.to_s).to contain(product.name)
#   end
# end
