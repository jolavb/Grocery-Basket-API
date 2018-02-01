require 'rails_helper'

RSpec.describe "RecipeItems", type: :request do
  describe "GET /recipe_items" do
    it "works! (now write some real specs)" do
      get recipe_items_path
      expect(response).to have_http_status(200)
    end
  end
end
