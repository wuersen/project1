class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :image
      t.text :description
      t.integer :likes
      t.integer :user_id

      t.timestamps
    end
  end
end
