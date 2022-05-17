require 'rails_helper'

RSpec.describe "ScheduleBases", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/schedule_bases/index"
      expect(response).to have_http_status(:success)
    end
  end
end
