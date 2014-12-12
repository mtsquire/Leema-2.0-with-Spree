class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         # For facebook authentication
         :omniauthable, :omniauth_providers => [:facebook]

  validates :first_name, presence: true
  validates :last_name, presence: true
  
  has_many :ratings
  has_many :comments, dependent: :destroy
  has_many :products, class_name: Spree::Product.to_s, dependent: :destroy

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_attached_file :cover_photo, :styles => { :large => "1000x380"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover_photo, :content_type => /\Aimage\/.*\Z/


  def full_name
    first_name + " " + last_name
  end

  def to_param
    full_name
  end

  def gravatar_url
      stripped_email = email.strip
      downcased_email = stripped_email.downcase
      hash = Digest::MD5.hexdigest(downcased_email)
      "http://gravatar.com/avatar/#{hash}"
  end

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

end