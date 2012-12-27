# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  first_name      :string(255)
#  last_name       :string(255)
#

class User < ActiveRecord::Base

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  
   has_secure_password

   has_one :website
   has_many :posts

end
