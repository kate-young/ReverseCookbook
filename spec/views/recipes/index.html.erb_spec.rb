require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  before(:each) do
    assign(:recipes, [
      Recipe.create!(
        :name => "Name",
        :description => "MyText"
      ),
      Recipe.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end
end
