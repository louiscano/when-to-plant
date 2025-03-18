class MigrateBodytoRichBodyPosts < ActiveRecord::Migration[7.1]
  def up
    Post.find_each do |post|
      post.update(rich_body: post.contenu)
    end
  end

  def down
    Post.find_each do |post|
      post.update(contenu: post.rich_body)
      post.update(rich_body: nil)
    end
  end
end
