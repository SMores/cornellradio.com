class ShowUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  validates :showID, presence: true
  validates :userID, presence: true
end
