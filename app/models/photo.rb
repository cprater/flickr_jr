class Photo < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  belongs_to :album_photo
  has_many :album_photos
  has_many :albums, through: :album_photos

  validates_presence_of :photo
end
