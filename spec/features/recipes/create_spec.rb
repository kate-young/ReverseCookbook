require 'spec_helper'

describe "Creating recipes" do
  let!(:recipe) { build_stubbed(:recipe) }

  def create_recipe(options={})
     options[:name] ||= recipe.name 
     options[:description] ||= recipe.description

     visit "/recipes"
     click_link "New Recipe"

     expect(page).to have_content("New Recipe")

     fill_in "Name", with: options[:name]
     fill_in "Description", with: options[:description]
     click_button "Create Recipe"
  end

  it "redirects to the recipe index page on success" do
     create_recipe
     expect(page).to have_content(recipe.name)
  end
end
