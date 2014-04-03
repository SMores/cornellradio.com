# == Schema Information
#
# Table name: podcasts
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  show_id     :integer
#  title       :string(255)
#  audio       :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Podcast < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :audio, presence: true, length: { maximum: 250 }
  validates :description, presence: true
end
