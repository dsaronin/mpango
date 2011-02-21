# ############################################################################
# BillingGateway encapsulates everything about gateway interaction
# variables needed to configure gateway assumed to be in config/app_config.yml
# future gateways may need more variables (add okay); not every gateway needs
# the entire set of variables
# min required:
# => gateway name selector
# => gateway url
# => seller_id (name, email, etc)
# => site certificate identifier
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
  class BillingGateway
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
    def initialize()
      
    end
    
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

# ############################################################################
  end # class SubscriptionGateway

end # module mpango
