class AddImageToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :image, :string
  end
end
