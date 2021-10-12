class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, foreign_key: true
      t.string :ing_name
      t.string :quantity

      t.timestamps
    end
  end
end
