class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :blurb, presence: true, length: { maximum: 250 }
  validates :content, presence: true
end
