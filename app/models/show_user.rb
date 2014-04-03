# == Schema Information
#
# Table name: show_users
#
#  id         :integer          not null, primary key
#  user_id    :string(255)
#  show_id    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ShowUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  validates :show_id, presence: true
  validates :user_id, presence: true
end
