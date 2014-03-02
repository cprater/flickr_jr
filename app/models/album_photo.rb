class AlbumPhoto < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :photo
  belongs_to :album
end
