class PaymentsController < ApplicationController
  def create
    # @product = params[:product_id]
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price * 100).to_i,
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail],
        :receipt_email => @user.email
      )
      if charge.paid
        Order.create!(user: @user, product: @product, total: @product.price)
        UserMailer.purchase_confirmation(@user, @product.name, @product.price).deliver_now
        flash[:notice] = "Thank you, we have received your order and payment!"
      end
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product)
  end
end
