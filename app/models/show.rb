# == Schema Information
#
# Table name: shows
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  profile_pic :string(255)
#  description :string(255)
#  fb_page     :string(255)
#  tw_page     :string(255)
#  ext_page    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Show < ActiveRecord::Base
  has_many :show_users, foreign_key: "show_id", dependent: :destroy
  has_many :personalities, through: :show_users, source: :user
  has_many :users, through: :show_users
  accepts_nested_attributes_for :show_users
  validates :title, presence: true
  validates :description, presence: true
  default_scope -> { order('shows.title ASC') }
end
