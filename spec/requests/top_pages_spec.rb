require 'rails_helper'

RSpec.describe "TopPages", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/top_pages/show"
      expect(response).to have_http_status(:success)
    end
  end
end
