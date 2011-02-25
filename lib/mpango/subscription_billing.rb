# ############################################################################
# SubscriptionBilling -- state machine for generic recurring billing processing
# => abstract from any specific gateway
# => this is separate from the ACCOUNT PRODUCT STATE
# => expected to be mix-in for a Subscription Class
# ############################################################################
# mpango stack (highest to lowest)  (SM = state machine)
#
#     tier                  SM? description
# ----------------------------------------------------------------------------
#  product feature              product tiers for an account
#  account product          SM  product billable transitions
#  subscription billing     SM  generic recurring billing processing
#  billing gateway              abstract interface to gateway 
#  gateway access               specific gateway control
# ############################################################################
module Mpango

  module SubscriptionBilling
  
  def self.included(base)
    base.send(:include, AASM) # act as state machine gem
    base.extend Mpango::SubscriptionBilling::ClassMethods
  end


  module ClassMethods
  
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

    aasm_column :subscription_state   # expects this field for persistance
    
    aasm_initial_state  :non_subscriber   # default starting state
    
    aasm_state  :non_subscriber     # majozi account which does not pay
    aasm_state  :billing_pending    # subscription billing pending at gateway
    aasm_state  :billing_failed     # subscription billing failed at gateway
    aasm_state  :active_subscriber  # subscription billing succeeded; waiting renewal
    
# ---------------------------------------------------------------------------
# initiate_subscription -- user initiates a purchase, clicking BUY NOW
# actions required: 
# => using cart, issue purchase request to gateway
# => do any necessary subscriber initializations
# ---------------------------------------------------------------------------
    aasm_event :initiate_subscription do
      transitions :to => :billing_pending, :from => :non_subscriber
    end
    
# ---------------------------------------------------------------------------
# subscription_success -- gateway: purchase was successful
# actions required: 
# => welcome email; confirmation of subscription payment
# => set subscription expire date
# ---------------------------------------------------------------------------
    aasm_event  :subscription_success do
      transitions :to => :active_subscriber, :from => :billing_pending
    end
    
# ---------------------------------------------------------------------------
# renewal_billing_time -- background/cron: time for renewal payment
# actions required:
# => issue repeat billing request per cart
# ---------------------------------------------------------------------------
    aasm_event  :renewal_billing_time do
      transitions :to => :billing_pending, :from => :active_subscriber
    end
    
# ---------------------------------------------------------------------------
# subscription_failure -- gateway: purchase failed
# actions required:
# => log failure, email to finance@majozi
# => remember reason for failure
# => start dunning email process; first email to all account admins
# ---------------------------------------------------------------------------
    aasm_event  :subscription_failure do
      transitions :to => :billing_failed, :from => :billing_pending
    end
    
# ---------------------------------------------------------------------------
# give_up_time -- background/cron: give up waiting for billing success; error
# actions required:
# => log failure, email to finance@majozi
# => start dunning email process; first email to all account admins
# ---------------------------------------------------------------------------
    aasm_event  :give_up_time do
      transitions :to => :billing_failed, :from => :billing_pending
    end
    
# ---------------------------------------------------------------------------
# re_initiate -- user elects to re-start the billing process at gateway
# actions required: 
# => using cart, issue purchase request to gateway
# ---------------------------------------------------------------------------
    aasm_event  :re_initiate do
      transitions :to => :billing_pending, :from => :billing_failed
    end
    
# ---------------------------------------------------------------------------
# expiry_time -- background/cron: give up dunning
# reduces account to a basic/minimual free account
# actions required: 
# => log to majozi transactions
# => email to all account admins, warn that account now at basic features only
# => tell AccountProduct control about it
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
    aasm_event :expiry_time do
      transitions :to => :non_subscriber, :from => :billing_failed
    end
    
# ---------------------------------------------------------------------------
# cancel_subscription -- user cancels subscription
# actions required:
# => confirmation email to all account admins
# => cancel at gateway
# => tell AccountProduct control about it
# => expire account
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
    aasm_event :cancel_subscription do
      transitions :to => :non_subscriber, :from => [:non_subscriber, :active_subscriber, :billing_pending, :billing_failed]
    end
    
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
  end  # ClassMethods


  end # module SubscriptionBilling

# ############################################################################
end # module Mpango