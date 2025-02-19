require 'rails_helper'

RSpec.describe "Book1s", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/book1/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/book1/show"
      expect(response).to have_http_status(:success)
    end
  end

end
