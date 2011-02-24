# ############################################################################
# Mpango -- recurring/subscription billing gem for Rails Apps
# => Version 1 focused on gateways like:
# =>   PayPal Web Standard		** default in version 1
# =>   Amazon SimplePay
# ############################################################################

module Mpango

  
end # module Mpango

  require 'aasm'

  require File.join(File.dirname(__FILE__), 'mpango', 'account_product')
  require File.join(File.dirname(__FILE__), 'mpango', 'billing_gateway')
  require File.join(File.dirname(__FILE__), 'mpango', 'product_feature')
  require File.join(File.dirname(__FILE__), 'mpango', 'subscription_billing')
  require File.join(File.dirname(__FILE__), 'mpango', 'gateways','paypal')
