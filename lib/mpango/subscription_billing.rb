# ---------------------------------------------------------------------------
# SubscriptionBilling -- state machine for billing processing
# => this is separate from the ACCOUNT PRODUCT STATE
# ---------------------------------------------------------------------------
module Mpango

  module SubscriptionBilling
    require 'aasm'  # act as state machine gem
    
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
    aasm_column :subscription_state   # expects this field for persistance
    
    aasm_initial_state  :non_subscriber   # majozi account which does not pay
    
    aasm_state  :billing_pending    # subscription billing pending at gateway
    aasm_state  :billing_failed     # subscription billing failed at gateway
    aasm_state  :active_subscriber  # subscription billing succeeded; waiting renewal
    
# ---------------------------------------------------------------------------
# initiate_subscription -- user initiates a purchase, clicking BUY NOW
# ---------------------------------------------------------------------------
    aasm_event :initiate_subscription do
      transitions :to => :billing_pending, :from => :non_subscriber
    end
    
# ---------------------------------------------------------------------------
# subscription_success -- gateway: purchase was successful
# ---------------------------------------------------------------------------
    aasm_event  :subscription_success do
      transitions :to => :active_subscriber, :from => :billing_pending
    end
    
# ---------------------------------------------------------------------------
# renewal_billing_time -- background/cron: time for renewal payment
# ---------------------------------------------------------------------------
    aasm_event  :renewal_billing_time do
      transitions :to => :billing_pending, :from => :active_subscriber
    end
    
# ---------------------------------------------------------------------------
# subscription_failure -- gateway: purchase failed
# ---------------------------------------------------------------------------
    aasm_event  :subscription_failure do
      transitions :to => :billing_failed, :from => :billing_pending
    end
    
# ---------------------------------------------------------------------------
# give_up_time -- background/cron: give up waiting for billing success; error
# ---------------------------------------------------------------------------
    aasm_event  :give_up_time do
      transitions :to => :billing_failed, :from => :billing_pending
    end
    
# ---------------------------------------------------------------------------
# re_initiate -- user elects to re-start the billing process at gateway
# ---------------------------------------------------------------------------
    aasm_event  :re_initiate do
      transitions :to => :billing_pending, :from => :billing_failed
    end
    
# ---------------------------------------------------------------------------
# expiry_time -- background/cron: give up dunning
# reduces account to a basic/minimual free account
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
    aasm_event :expiry_time do
      transitions :to => :non_subscriber, :from => :billing_failed
    end
    
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

  end # module SubscriptionBilling

end # module Mpango