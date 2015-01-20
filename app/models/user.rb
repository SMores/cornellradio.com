# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  profile_pic     :string(255)
#  password        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  level           :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  bio             :string(255)
#

class User < ActiveRecord::Base
  extend FriendlyId
  scope :active, -> {where(active: true)}
  friendly_id :full_name, use: [:slugged, :finders]

  has_many :show_users, foreign_key: "user_id", dependent: :destroy
  has_many :posts
  has_many :podcasts
  has_many :shows, through: :show_users
  has_secure_password
  before_save { email.downcase! }
  before_create :create_remember_token
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: { case_sensative: false }
  validates :password, length: { minimum: 6 }, if: :password_validation_required?
  has_attached_file :profile_pic
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/

  default_scope order: 'users.first_name ASC'

  def full_name
    "#{first_name} #{last_name}"
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end 

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def password_validation_required?
    self.password_digest.blank? || !@password.blank?
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end


