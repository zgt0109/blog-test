# == Schema Information
#
# Table name: cases
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  doctor_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#
# Indexes
#
#  index_cases_on_doctor_id  (doctor_id)
#  index_cases_on_user_id    (user_id)
#

class Case < ActiveRecord::Base
  belongs_to :user
  belongs_to :doctor

  attr_accessible :content, :user_id, :doctor_id, :name
end
