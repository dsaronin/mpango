# ############################################################################
# ############################################################################
module Mpango

# ############################################################################
  module ProductFeature

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

# ############################################################################
end # module Mpango
