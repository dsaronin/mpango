require 'net/http'
require 'net/https'

# #############################################################################
module Mpango
  module Gateways

# #############################################################################
# PayPal Website Payments Standard Service
# #############################################################################
#  IPN
#
#  Using Instant Payment Notification to Track Subscribe Transactions
#  PayPal lets your web server receive messages about Subscribe transactions and
#  payment activity on your account. If you activate Instant Payment 
#  Notification, PayPal sends messages when:  
#  -  Payments are first made, with a status of completed or pending.
#  -  Payments clear, fail, or are denied, if the initial status was pending.
#  -  Subscriptions begin, end, or are canceled, 
#     if you use Subscriptions Password Management.
#
#  How Billing Cycles and Recurring Payments Work
#  
#  PayPal attempts to collect recurring payments from subscribers on the day 
#  after the previous billing cycle or trial period ends. Billing cycles can be 
#  daily, weekly, monthly or yearly, depending on the terms of the original 
#  subscription.
#
#  Working With Modify Subscription Buttons
#
#  Let subscribers modify their active subscriptions by adding a Modify 
#  Subscription button to your website. If you offer different subscriptions 
#  levels, Modify Subscription buttons let you subscribers upgrade to a higher 
#  level without an interruption in service.
#  
#  How PayPal Lets Subscribers Modify Their Subscriptions
#  Modify Subscription buttons let subscribers accept a new set of subscriptions
#  terms and pricing for their current, active subscriptions.
#  
#  You can write the HTML code for Modify Subscription buttons that allow 
#  subscribers to:
#  
#    Modify their active subscriptions, or sign up for new subscriptions
#    Modify their active subscriptions only#
#
#  Working With Unsubscribe Buttons
#  
#  Let subscribers cancel their active subscriptions by adding Unsubscribe 
#  buttons to your website.
#  
#  How PayPal Cancels Subscriptions
#  
#  When subscribers cancel subscriptions, they avoid future recurring payments.
#  If subscribers cancel their subscriptions before payment is sent on the 
#  day that a recurring payment is due, their subscriptions are canceled 
#  immediately and no payments are made.
#  
#  NOTE: Subscribers can cancel their subscriptions from the Subscription 
#  Details pages of their PayPal accounts.
#
#  Reattempting Failed Recurring Payments With Subscribe Buttons
#  
#  PayPal cancels subscriptions when recurring payments fail. A recurring 
#  payment fails if funds cannot be moved from the subscriber’s PayPal account 
#  to your own. Limits on the availability of funds in PayPal accounts occur 
#  rarely, for a variety of reasons.
#  
#  Temporary limits that PayPal places on subscribers’ accounts are often 
#  lifted quickly. To avoid unnecessary cancellations, you can specify that 
#  PayPal should reattempt failed payments before canceling subscriptions.
#  
#  How PayPal Reattempts Failed Recurring Payments
#  
#  PayPal reattempts to collect recurring payments three days after the day 
#  on which recurring payments fail. If the first reattempt to collect a 
#  recurring payment fails, PayPal waits 5 days to reattempt a second time. 
#  If the second reattempt fails, PayPal cancels the subscription.
#  
#  NOTE: Payments made with bank accounts are automatically reattempted 3 days 
#  after PayPal notifies subscribers that their payments failed.  
#  Reattempts will not occur if another subscription payment is scheduled within 
#  14 days of the failed payment, so that payments do not overlap.
#
# #############################################################################

    class PayPalWPS

# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
  def paypal_url(return_url)
    values = {
      :business => 'seller_1229899173_biz@railscasts.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id
    }
    line_items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.unit_price,
        "item_name_#{index+1}" => item.product.name,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => item.quantity
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end    
  # + values.map { |k,v| "#{k} = #{v}"}.join("&")
  
  end  # class PayPalWPA

# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
script/generate nifty_scaffold payment_notification params:text cart_id:integer status:string transaction_id:string create
rake db:migrate
curl -d "txn_id=3XC103945N720211C&invoice=923204115&payment_status=Completed" http://localhost:3000/payment_notifications
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# #############################################################################

  end  # module Gateways
end  #  module Mpango
# #############################################################################
