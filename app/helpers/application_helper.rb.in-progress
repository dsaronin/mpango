module ApplicationHelper
  
  class SubscriptionButtonBuilder < ActionView::Helpers::FormBuilder
    
# -----------------------------------------------------------------------------
# <!-- carts/show.html.erb -->
# <% form_tag APP_CONFIG[:gateway_url] do %>
#  <%= hidden_field_tag :cmd, "_s-xclick" %>
#  <%= hidden_field_tag :encrypted, @cart.paypal_encrypted(products_url, payment_notifications_url(:secret => APP_CONFIG[:gateway_secret])) %>
#  <p><%= submit_tag "subscribe" %></p>
# <% end %>
# -----------------------------------------------------------------------------

  def self.encrypted_subscription_button_tag(billing_options, *args)
    validate_subscription_button_tag_options(billing_options)
    
  end 
  

private

  unless const_defined?( VALID_SUBSCRIPTION_BUTTON_OPTIONS )
    VALID_SUBSCRIPTION_BUTTON_OPTIONS = [
      :products_url, :notifications_url, :gateway_url      
    ]
  end
# ------------------------------------------------------------------------------
# validate_subscription_button_tag_options -- raises exception if invalid
# ------------------------------------------------------------------------------
  def validate_subscription_button_tag_options(options)

    options.assert_valid_keys(VALID_SUBSCRIPTION_BUTTON_OPTIONS)
    
    VALID_SUBSCRIPTION_BUTTON_OPTIONS.each do |key|
      unless options[key]
        raise ArgumentError,"required option is missing: #{key}"
      end
     
    end # each option
     
  end


  
  end # class SubscriptionButtonBuilder
end # module ApplicationHelper
