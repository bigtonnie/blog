class AddPublishedAtToPost < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :published_at, :datetime
  end
end
