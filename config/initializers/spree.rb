# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # # Example:
  # # Uncomment to stop tracking inventory levels in the application
  # # config.track_inventory_levels = false
  # attachment_config = {
  #   s3_credentials: {
  #     access_key_id: "AWS_ACCESS_KEY_ID",
  #     secret_access_key: "AWS_SECRET_ACCESS_KEY",
  #     bucket: "S3_BUCKET_NAME",
  #   },
 
  #   storage:        :s3,
  #   s3_headers:     { "Cache-Control" => "max-age=31557600" },
  #   s3_protocol:    "https",
  #   bucket:         "S3_BUCKET_NAME",
 
  #   styles: {
  #     mini:     "48x48>",
  #     small:    "100x100>",
  #     product:  "240x240>",
  #     large:    "600x600>"
  #   },
 
  #   path:          ":rails_root/public/spree/products/:id/:style/:basename.:extension",
  #   default_url:   "/spree/products/:id/:style/:basename.:extension",
  #   default_style: "product",
  # }
 
  # attachment_config.each do |key, value|
  #   Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
  # end
end unless Rails.env.test?

Spree.user_class = "User"

          Rails.application.config.to_prepare do
            require_dependency 'spree/authentication_helpers'
          end
