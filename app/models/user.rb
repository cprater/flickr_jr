class User < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true

	has_many :photos
	has_many :albums
	
	has_secure_password
end