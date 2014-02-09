class User < ActiveRecord::Base

	has_many :articles, dependent: :destroy
	has_many :events, dependent: :destroy
	has_many :comments, dependent: :destroy

	attr_accessible :name, :email, :password, :password_confirmation

	has_secure_password

end
