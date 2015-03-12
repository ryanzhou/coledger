require 'rails_helper'

RSpec.describe "Users Requests" do
  describe "POST /users" do
    it "signs up a user" do
      post "/users", { username: "test" }.to_json
      expect(last_response.status).to eq(200)
    end
  end
end
