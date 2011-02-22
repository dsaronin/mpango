# ############################################################################
# Mpango -- recurring/subscription billing gem for Rails Apps
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
#    Subscription.account_cart = Cart.new creates default cart for lifetime of account
#    ProductFeature.new sets state
#    AccountProduct.new sets state
#    SubscriptionBilling.new sets state, 
#     remembers asynch_purchasing_notification_url,
    
    

# user clicks BUY NOW for product tier X
#   capture info in upgrade_cart = Cart.new(params,
#   product_feature.upgrade_subscription! makes any changes product-wise up/down
#   account_product.upgrade_subscription!
#     if new
#       subscription_billing.initiate_subscription!
#       return gateway.initiate_subscription( cart )
#         -- they do everything ("button") gateways like PayPal/Amazon will return 
#            an encrypted POST FORM for the view;
#            once user clicks the SUBSCRIBE button, user goes to PayPal site
#            => if user cancels (doesnt do anything) ...?
#              cron task needs to check for stranded requests
#            => if user purchases, PayPal returns user to Majozi site
#              record the return
#         -- we do everything ("self_form") gateways will just return the cart
#            the controller will have to somehow know what to do
#            when user agrees to purchase, return to this part of processing stack
#     else
#       subscription_billing.change_subscription
#     end   # 
  # 
