require 'spec_helper'

describe "Creating recipes" do
  let!(:recipe) { create(:recipe) }

  it "successfully destroys the recipe" do
     recipe.reload
     visit "/recipes"

     puts recipe.id
     within "#recipe_#{recipe.id}" do
        click_link "Destroy" 
     end

     expect(page).to have_content("Recipe was successfully destroyed.")
     expect(page).to_not have_content(recipe.name)
  end
end
