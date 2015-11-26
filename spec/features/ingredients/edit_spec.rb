require 'spec_helper'

describe "Editing ingredients" do
  let!(:ingredient) { create(:ingredient) }

  def edit_ingredient(options={})
     options[:name] ||= "My Ingredient"
     ingredient = options[:ingredient]

     visit "/ingredients"
     within "#ingredient_#{ingredient.id}" do
	click_link "Edit"
     end
     expect(page).to have_content("Editing Ingredient")
     fill_in "Name", with: options[:name]
     click_button "Update Ingredient"
  end

  it "successfully updates ingredient with new information" do
     edit_ingredient ingredient: ingredient

     ingredient.reload

     expect(page).to have_content("Ingredient was successfully updated.")
     expect(page).to have_content("My Ingredient")
  end
  it "displays an error when the ingredient has no name" do
     edit_ingredient ingredient: ingredient, name: ""

     ingredient.reload
     
     expect(page).to have_content("Name can't be blank")
  end
  context "when ingredient with same name already exists" do
     let!(:existing_ingredient) { Ingredient.create(name: "Pepper") }
    
     it "displays an error when creating ingredient with non-unique name" do
	edit_ingredient ingredient: ingredient, name: "Pepper"
	expect(page).to have_content("Name has already been taken")
     end
   end
end
