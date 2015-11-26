require 'spec_helper'

describe "Creating ingredients" do
  let!(:ingredient) { create(:ingredient) }

  it "successfully destroys the ingredient" do
     ingredient.reload
     visit "/ingredients"

     puts ingredient.id
     within "#ingredient_#{ingredient.id}" do
        click_link "Destroy" 
     end

     expect(page).to have_content("Ingredient was successfully destroyed.")
     expect(page).to_not have_content(ingredient.name)
     expect(Ingredient.count).to eq(0)
  end
end
