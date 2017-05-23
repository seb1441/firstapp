class PaymentsController < ApplicationController
  def create
    # @product = params[:product_id]
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      # charge = Stripe::Charge.create(
      #   :amount => @product.price * 100
      #   :currency => "usd",
      #   :source => token,
      #   :description => params[:stripeEmail],
      #   :receipt_email => @user.email
      # )
      charge = Stripe::Charge.create(
        :amount => @product.price * 100,
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      )
      if charge.paid
        Order.create(user_id: @user, product_id: @product.id, total: @product.price)
      end
      t.integer "user_id"
      t.integer "product_id"
      t.float   "total"
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product)
  end
end
