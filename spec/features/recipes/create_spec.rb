require 'spec_helper'

describe "Creating recipes" do
  def create_recipe(options={})
     options[:name] ||= "My Recipe"
     options[:description] ||= "This is my recipe"

     visit "/recipes"
     click_link "New Recipe"
     expect(page).to have_content("New Recipe")
     fill_in "Name", with: options[:name]
     fill_in "Description", with: options[:description]
     click_button "Create Recipe"
  end

  it "redirects to the recipe index page on success" do
     create_recipe
     expect(page).to have_content("My Recipe")
  end
end
