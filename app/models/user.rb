class User < ActiveRecord::Base

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  
   has_secure_password

   has_one :website

end
