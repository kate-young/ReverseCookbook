class CreateIngredientsRecipes < ActiveRecord::Migration
  def up 
    create_table :ingredients_recipes do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
    end
  end
  def down
    drop_table :ingredients_recipes
  end
end
