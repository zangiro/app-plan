class CreatePostGenreTags < ActiveRecord::Migration[7.2]
  def change
    create_table :post_genre_tags do |t|
      t.references :post, foreign_key: true
      t.references :genre_tag, foreign_key: true

      t.timestamps
    end
  end
end
