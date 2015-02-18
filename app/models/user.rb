class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         # For facebook authentication
         :omniauthable, :omniauth_providers => [:facebook]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates_uniqueness_of :store_name, :on => :update

  has_many :ratings
  has_many :comments, dependent: :destroy
  has_many :products, class_name: Spree::Product.to_s, dependent: :destroy

  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "80x80>", :mini => "20x20>" }, :default_url => "/assets/leema-nav-logo.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_attached_file :cover_photo, :styles => { :large => "1900"}, :default_url => "/assets/profile-placeholder.jpg"
  validates_attachment_content_type :cover_photo, :content_type => /\Aimage\/.*\Z/

  has_attached_file :store_logo, :styles => { :default => "80x80>"}, :default_url => "/assets/leema-seller-logo.jpg"
  validates_attachment_content_type :store_logo, :content_type => /\Aimage\/.*\Z/
  
  before_save :create_permalink
  #automatically create new users as admins so they can become suppliers
  after_save :create_admin

  def full_name
    first_name + " " + last_name
  end

  def to_param
    permalink
  end

  def leema_admin?
    if email == "brandon.a.hay@gmail.com"
      true
    elsif email == "mtsquire@gmail.com"
      true
    elsif email == "scottlevy89@gmail.com"
      true
    else
      false
    end
  end

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

  def create_admin
    spree_roles << Spree::Role.find_or_create_by(name: "admin")
  end

  private
    def create_permalink
      if store_name
        self.permalink = store_name.downcase.gsub(" ","-")
      elsif username
        self.permalink = username.downcase.gsub(" ", "-")
      end
    end

end
