class PaymentNotificationsController < ApplicationController

protect_from_forgery :except => [:create]  # obviates need for authencity token

# this is needed so that PayPal-like services with async status communications
# will be able to have a URL to asynch advise us of payment notifications
# by recording all notifications within DB, we have a complete history of
# of an account

# TODO: make this gateway agnostic by having wrappers lower down
# use shared secret to confirm paypal IPN validity


  def create
    PaymentNotification.create!(
      :params => params, 
      :cart_id => params[:invoice], 
      :status => params[:payment_status], 
      :transaction_id => params[:txn_id]
    )
    render :nothing => true
  end

end   # class PaymentNotificationsController
