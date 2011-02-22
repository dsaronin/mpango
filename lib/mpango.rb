# ############################################################################
# Mpango -- recurring/subscription billing gem for Rails Apps
# => Version 1 focused on gateways like:
# =>   PayPal Web Standard
# =>   Amazon SimplePay
# ############################################################################
# ############################################################################
# mpango stack (highest to lowest)  (SM = state machine)
#
#     tier                  SM? description
# ----------------------------------------------------------------------------
#  product feature          SM  product tiers for an account
#  account product          SM  product billable transitions
#  subscription billing     SM  generic recurring billing processing
#  billing gateway              abstract interface to gateway 
#  gateway access               specific gateway control
# ############################################################################

module Mpango
  
  
end # module Mpango

# ############################################################################
# Stack Action Descriptions (from action trigger downwards thru stack)
# 
# when world account created, 
#    Subscription.account_cart = Cart.new creates default cart for an account
#    ProductFeature.new sets state
#    AccountProduct.new sets state
#    SubscriptionBilling.new sets state, 
#     remembers asynch_purchasing_notification_url (controller level)
#
# when user clicks BUY NOW for product tier X
#   capture info in upgrade_cart = Cart.new(params,
#   product_feature.upgrade_subscription! 
#      remember that payment process started
#   account_product.upgrade_subscription!
#   -- transitions :to => :billable_product, :from => [:unbillable_product, :trial_period, :disabled]
#       subscription_billing.initiate_subscription!
#       pay_button = gateway.initiate_subscription( cart )
#         -- this is an encrypted POST FORM for the view;
#            once user clicks the SUBSCRIBE button, user goes to PayPal site
#            => if user cancels (doesnt do anything) ...?
#              cron task needs to check for stranded requests
#            => if user purchases, PayPal returns user to main site
#              record the return
#   -- transitions :to => :billable_product,   :from => :billable_product
#       subscription_billing.change_subscription
# 
