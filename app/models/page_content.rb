# == Schema Information
#
# Table name: page_contents
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class PageContent < ActiveRecord::Base
end
