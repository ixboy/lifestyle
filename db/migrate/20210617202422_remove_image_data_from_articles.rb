class RemoveImageDataFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :image_data, :text
  end
end
