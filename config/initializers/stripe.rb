if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_dmZiW3yvGGKfJWw7niN3Vpbb',
    :secret_key => 'sk_test_tqN3V95JExWqbghmELaDcJfy'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

unless defined? STRIPE_JS_HOST
  STRIPE_JS_HOST = 'https://js.stripe.com'
end
