class AddCategoryIdToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :category_id, :integer
  end
end
