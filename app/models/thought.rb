# == Schema Information
#
# Table name: thoughts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Thought < ActiveRecord::Base
  attr_accessible :body, :title
end
