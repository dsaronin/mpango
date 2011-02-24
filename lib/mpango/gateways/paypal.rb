require 'net/http'
require 'net/https'

# #############################################################################
module Mpango

#
# -----------------------------------------------------------------------------
# for testing in dev mode at localhost, we'll need the following to be used
# to simulate IPN payment notification of a purchase. Grab the transaction id
# txn_id from the page paypal uses after purchase in sandbox, and run following
# from a local command window, replacing the txn_id field shown below.
# 
# 
# curl -d "txn_id=3XC103945N720211C&invoice=923204115&payment_status=Completed" http://localhost:3000/payment_notifications
# -----------------------------------------------------------------------------

# #############################################################################

  module PayPalWPS

# -----------------------------------------------------------------------------
# ASSUMPTIONS:
# => config/app_config.yml holds billing gateway configuration values
# => site certificates and encryption info:
#     certs/biller_cert.pem -- paypal public key
#     certs/app_cert.pem    -- our public key
#     certs/app_key.pem     -- our private key
# => shopping cart has cart_items each with: 
#    unit_price, product (name), id, quantity
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# encrypted_subscription_form -- returns encryption for accessing paypal
# see gem README for details on how to set up certs
# -----------------------------------------------------------------------------
  def encrypted_subscription_form(return_url, notify_url)
    values = {
      :business => APP_CONFIG[:gateway_seller_id],
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :notify_url => notify_url,
      :cert_id => APP_CONFIG[:gateway_site_certificate]
    }
    cart_items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.unit_price,
        "item_name_#{index+1}" => item.product.name,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => item.quantity
      })
    end
    encrypt_for_paypal(values)
  end
  
private

  BILLER_CERT_PEM = File.read("#{Rails.root}/certs/biller_cert.pem")
  APP_CERT_PEM = File.read("#{Rails.root}/certs/app_cert.pem")
  APP_KEY_PEM = File.read("#{Rails.root}/certs/app_key.pem")

# -----------------------------------------------------------------------------
# encrypt_for_paypal -- encryption for PayPal
# code courtesy of Railscasts #143
# -----------------------------------------------------------------------------
  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(BILLER_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end

# -----------------------------------------------------------------------------
#
## -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
  
  end  # module PayPalWPA
# #############################################################################

end  #  module Mpango
# #############################################################################
