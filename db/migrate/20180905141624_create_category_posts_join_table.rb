class CreateCategoryPostsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :posts, id: false do |t|
      t.references    :category, foreign_key: true
      t.references    :post, foreign_key: true
    end
  end
end
