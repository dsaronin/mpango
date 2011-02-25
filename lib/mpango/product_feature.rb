# ############################################################################
# ############################################################################
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

# ############################################################################
  module ProductFeature
  
  def self.included(base)
    base.extend Mpango::ProductFeature::ClassMethods
  end


  module ClassMethods
  end
  
    include AASM  # act as state machine gem

# ---------------------------------------------------------------------------
# => product feature levels
# ---------------------------------------------------------------------------
@@feature_levels = [
      :team,          # level 1: basic free
      :group,         # level 2: basic group
      :organization,  # level 3: multiple groups
      :professional,  # level 4: bigger organization
      :platinum,      # level 5: unlimited features
  ]
    
  end # module ProductFeature
# => transition premium features to lower if downgrade
# => initiate purchase change if downgrade

# ############################################################################
end # module Mpango
