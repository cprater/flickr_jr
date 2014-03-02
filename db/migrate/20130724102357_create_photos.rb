class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :user
      t.belongs_to :album
      t.string :name
      t.string :photo

      t.timestamps
    end
  end
end
