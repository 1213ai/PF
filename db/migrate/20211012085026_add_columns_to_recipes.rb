class AddColumnsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :sweetness, :float
    add_column :recipes, :spicy, :float
    add_column :recipes, :salty, :float
    add_column :recipes, :bitter_taste, :float
    add_column :recipes, :bitter_taste, :float
  end
end
