# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_user_id  (user_id)
#

class Topic < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :name

  validates :name, presence: true
end
