class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
    @products = Product.limit(3)
  end

  def thank_you
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @phone_number = params[:phone_number]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@first_name, @last_name, @email, @phone_number, @message).deliver_now
  end
end
