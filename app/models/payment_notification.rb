class PaymentNotification < ActiveRecord::Base

  belongs_to    :cart
  serialize     :params
  after_create  :mark_cart_as_purchased

private

  def mark_cart_as_purchased
    if status == "Completed"
      cart.update_attribute(:purchased_at, Time.now)
    end
  end

# for encryption use:
# TODO: if the secret or other fields DONT match, security log error, notify 
# billings admin, etc of possible fraudulent attempts to spoof system

def mark_cart_as_purchased
  if status == "Completed" && params[:secret] == APP_CONFIG[:paypal_secret] &&
      params[:receiver_email] == APP_CONFIG[:paypal_email] &&
      params[:mc_gross] == cart.total_price.to_s && params[:mc_currency] == "USD"
    cart.update_attribute(:purchased_at, Time.now)
  end
end

end
