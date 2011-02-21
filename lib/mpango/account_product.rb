# ############################################################################
# AccountProduct -- state machine for product levels for an account
# => expected to be mix-in for an Account Class
# => 
# ############################################################################
module Mpango
  module AccountProduct
    require 'aasm'  # act as state machine gem
    
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
    aasm_column :account_state   # expects this field for persistance
    
    aasm_initial_state  :trial_period   # all accounts start here by default
    
    aasm_state  :trial_period           # majozi free_trial period: unbillable
    aasm_state  :billable_product       # proeduct which can be billed
    aasm_state  :unbillable_product     # proeduct which can NOT be billed
    aasm_state  :disabled               # user-requested disable prior to cancel
    aasm_state  :defunct                # gonzo

# ---------------------------------------------------------------------------
# upgrade_subscription -- change subscription level (down or up)
# actions required:
# => initiate purchase if upgrading; coordinate with next billing cycle
# => transition premium features to lower if downgrade
# => initiate purchase change if downgrade
# ---------------------------------------------------------------------------
    aasm_event :upgrade_subscription do
      transitions :to => :billable_product,   :from => [:unbillable_product, :trial_period, :disabled]
    end
    
# ---------------------------------------------------------------------------
# expire_subscription -- change to unbillable product
# actions required:
# => transition premium features to basic team
# => cease any recurring billing
# ---------------------------------------------------------------------------
    aasm_event :expire_subscription do
      transitions :to => :unbillable_product,   :from => [:billable_product, :trial_period]
    end

# ---------------------------------------------------------------------------
# disable_account -- disable the account, precursor to destroying account
# actions required:
# => takes account off the grid; makes it inaccessible, but is still data-viable
# ---------------------------------------------------------------------------
  aasm_event  :disable_account do
      transitions :to => :disabled,  :from => [:trial_period, :billable_product, unbillable_product]
  end

# ---------------------------------------------------------------------------
# destroy_account -- destroy account
# actions required:
# => destroy everything, including world
# ---------------------------------------------------------------------------
  aasm_event  :destroy_account do
      transitions :to => :defunct,  :from => disabled
  end

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
    
  end # module AccountProduct

# ############################################################################
end # module Mpango