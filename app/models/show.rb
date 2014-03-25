class Show < ActiveRecord::Base
  has_many :show_users, foreign_key: "show_id", dependent: :destroy
  has_many :personalities, through: :show_users, source: :user
  validates :title, presence: true
  validates :description, presence: true
  default_scope -> { order('shows.title ASC') }
end
