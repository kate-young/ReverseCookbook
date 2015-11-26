require 'rails_helper'

RSpec.describe "ingredients/index", type: :view do
  before(:each) do
    assign(:ingredients, [
      create(:ingredient),
      Ingredient.create(name: "Pepper") 
    ])
  end

  it "renders a list of ingredients" do
    render
  end
end
