Spree::Product.class_eval do
  belongs_to :user, class_name: Spree.user_class.to_s
  def test_method
    "hi"
  end
end