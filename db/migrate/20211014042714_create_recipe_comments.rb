class CreateRecipeComments < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_comments do |t|
      t.text :comment
      t.references :recipe, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
