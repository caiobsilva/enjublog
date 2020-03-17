class AddDeletedAtToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :deleted_at, :datetime
  end
end
