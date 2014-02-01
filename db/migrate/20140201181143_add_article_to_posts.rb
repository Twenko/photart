class AddArticleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :article_id, :integer

  end
end
