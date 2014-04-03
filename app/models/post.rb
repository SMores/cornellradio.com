# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  show_id    :integer
#  title      :string(255)
#  blurb      :string(255)
#  content    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :blurb, presence: true, length: { maximum: 250 }
  validates :content, presence: true
end
