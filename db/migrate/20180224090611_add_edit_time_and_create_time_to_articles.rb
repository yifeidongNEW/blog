class AddEditTimeAndCreateTimeToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :edit_time, :datetime
    add_column :articles, :create_time, :datetime
  end
end
