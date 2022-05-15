require 'rails_helper'

RSpec.describe "Regulations", type: :request do
  describe "GET /terms" do
    it "returns http success" do
      get "/regulations/terms"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /privacy" do
    it "returns http success" do
      get "/regulations/privacy"
      expect(response).to have_http_status(:success)
    end
  end
end
