class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :album_name
      t.string :artist_name
      t.string :comment

      t.timestamps
    end
  end
end
