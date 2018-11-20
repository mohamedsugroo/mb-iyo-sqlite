class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :site_id
      t.string :featuredmedia
      t.string :author_name
      t.string :author_avatar
      t.string :tags
      t.string :author
      t.string :author_avatars
      t.string :source_link
      t.string :post_type

      t.timestamps
    end
  end
end
