# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
  #config.use_s3 = true
  #config.s3_bucket = 'brandonhay.aws.bucket'
  #config.s3_access_key = "AKIAIVPZCTPOKL3FT3XA"
  # config.s3_secret = "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"
end

Spree.user_class = "User"

          Rails.application.config.to_prepare do
            require_dependency 'spree/authentication_helpers'
          end
