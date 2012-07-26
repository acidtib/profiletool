class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  has_one :website


end
