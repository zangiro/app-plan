class CreatePlaylists < ActiveRecord::Migration[7.2]
  def change
    create_table :playlists do |t|
      t.string :title, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
