require 'spec_helper'

describe "Creating ingredients" do
  let!(:ingredient) { build_stubbed(:ingredient) }

  def create_ingredient(options={})
     options[:name] ||= ingredient.name 

     visit "/ingredients"
     click_link "New Ingredient"

     expect(page).to have_content("New Ingredient")

     fill_in "Name", with: options[:name]
     click_button "Create Ingredient"
  end
  before(:each) do
     expect(Ingredient.count).to eq(0)
  end
  it "redirects to the ingredient index page on success" do
     create_ingredient
     expect(page).to have_content(ingredient.name)
     expect(Ingredient.count).to eq(1)
  end
  it "displays an error when the ingredient has no name" do
     create_ingredient name: ""
     expect(page).to have_content("Name can't be blank")
     expect(Ingredient.count).to eq(0)
  end
end
