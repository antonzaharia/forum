class AddCategoryToDiscussion < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :category_id, :bigint
  end
end
