# ---------------------------------------------------------------------------
# SubscriptionGateway encapsulates everything about gateway interaction
# variables needed to configure gateway assumed to be in config/app_config.yml
# future gateways may need more variables (add okay); not every gateway needs
# the entire set of variables
# min required:
# => gateway name selector
# => gateway url
# => seller_id (name, email, etc)
# => site certificate identifier
# ---------------------------------------------------------------------------
module Mpango
  class SubscriptionGateway
    def initialize()
      
    end
    
  end # class SubscriptionGateway
end # module mpango
