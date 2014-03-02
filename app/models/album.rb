class Album < ActiveRecord::Base
  # Remember to create a migration!
  has_many :album_photos
  has_many :photos, through: :album_photos
  
  belongs_to :user
end
