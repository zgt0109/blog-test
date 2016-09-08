# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_post_id  (post_id)
#

class Tag < ActiveRecord::Base
  belongs_to :post
  attr_accessible :name
end
