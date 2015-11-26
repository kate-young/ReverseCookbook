require 'spec_helper'

describe "Creating recipes" do
  let!(:recipe) { create(:recipe) }

  def edit_recipe(options={})
     options[:name] ||= "My Recipe"
     options[:description] ||= "This is my recipe"
     recipe = options[:recipe]

     visit "/recipes"
     within "#recipe_#{recipe.id}" do
	click_link "Edit"
     end
     expect(page).to have_content("Editing Recipe")
     fill_in "Name", with: options[:name]
     fill_in "Description", with: options[:description]
     click_button "Update Recipe"
  end

  it "successfully updates recipe with new information" do
     edit_recipe recipe: recipe

     recipe.reload

     expect(page).to have_content("Recipe was successfully updated.")
     expect(page).to have_content("My Recipe")
     expect(page).to have_content("This is my recipe")
  end
  it "displays an error when the recipe has no name" do
     edit_recipe recipe: recipe, name: ""

     recipe.reload
     
     expect(page).to have_content("Name can't be blank")
  end
  it "displays an error when the recipe has no description" do
     edit_recipe recipe: recipe, description: ""

     recipe.reload

     expect(page).to have_content("Description can't be blank") 
  end
end
