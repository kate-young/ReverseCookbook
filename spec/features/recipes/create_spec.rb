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
  before(:each) do
     expect(Recipe.count).to eq(0)
  end
  it "redirects to the recipe index page on success" do
     create_recipe
     expect(page).to have_content(recipe.name)
     expect(Recipe.count).to eq(1)
  end
  it "displays an error when the recipe has no name" do
     create_recipe name: ""
     expect(page).to have_content("Name can't be blank")
     expect(Recipe.count).to eq(0)
  end
  it "displays an error when the recipe has no description" do
     create_recipe description: ""
     expect(page).to have_content("Description can't be blank")
     expect(Recipe.count).to eq(0)
  end
end
