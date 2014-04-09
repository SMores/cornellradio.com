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
  has_many :show_users, foreign_key: "user_id", dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :shows, through: :show_users
  has_secure_password
  before_save { email.downcase! }
  before_create :create_remember_token
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: { case_sensative: false }
  validates :password, length: { minimum: 6 }, if: :password_validation_required?

  default_scope order: 'users.first_name ASC'

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end 

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def User.save(upload, name)
    path = Rails.root.join('public', 'uploaded', name)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end

  def password_validation_required?
    self.password_digest.blank? || !@password.blank?
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end


