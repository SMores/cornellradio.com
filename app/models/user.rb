class User < ActiveRecord::Base
  has_many :show_users, foreign_key: "user_id", dependent: :destroy
  has_many :posts, dependent: :destroy
  has_secure_password
  before_save { email.downcase! }
  before_create :create_remember_token
  validates :firstName, presence: true, length: { maximum: 20 }
  validates :lastName, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: { case_sensative: false }
  validates :password, length: { minimum: 6 }

  default_scope order: 'users.firstName ASC'

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end 

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end


