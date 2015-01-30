Spree::Product.class_eval do
  belongs_to :user, class_name: Spree.user_class.to_s

  validates :leema_description, presence: true

  #copied from the image.rb file in spree_core
  validate :no_attachment_errors

    has_attached_file :photo,
                      styles: { mini: '48x48>', small: '100x100>', product: '240x240>', large: '600x600>' },
                      default_style: :product,
                      url: '/spree/products/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/products/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
    validates_attachment :photo,
      :presence => true,
      :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }

    # save the w,h of the original image (from which others can be calculated)
    # we need to look at the write-queue for images which have not been saved yet

    # BHay: Commented this because not sure that we need to calculate original image?
    # after_post_process :find_dimensions

    #used by admin products autocomplete
    def mini_url
      photo.url(:mini, false)
    end

    def find_dimensions
      temporary = photo.queued_for_write[:original]
      filename = temporary.path unless temporary.nil?
      filename = photo.path if filename.blank?
      geometry = Paperclip::Geometry.from_file(filename)
      self.photo_width  = geometry.width
      self.photo_height = geometry.height
    end

    # if there are errors from the plugin, then add a more meaningful message
    def no_attachment_errors
      unless photo.errors.empty?
        # uncomment this to get rid of the less-than-useful interrim messages
        # errors.clear
        errors.add :photo, "Paperclip returned errors for file '#{photo_file_name}' - check ImageMagick installation or image source file."
        false
      end
    end
  # end image.rb from spree_core

  def self.search(search)
    if search
      where(['name ILIKE ?', "%#{search}%"])
    else
      @products = Spree::Product.all
    end
  end

end