class AddAuthorNameAndAuthorIdToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :author_name, :string
    add_column :articles, :author_id, :string
    add_index :articles, :author_id
  end
end
