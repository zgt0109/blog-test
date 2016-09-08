# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tags_attributes

  validates :name, :presence => true
  validates :title, :presence => true, :length => { :minimum => 5 }
  has_many :comments, :dependent => :destroy
  has_many :tags
  belongs_to :user

  accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k,v| v.blank? } }
end
