require 'rails_helper'

describe "Users Requests" do
  describe "POST /api/users" do
    context "valid params" do
      it "signs up a user" do
        expect {
          post_json "/api/users", { username: "foobar", password: "passw0rd", email: "foobar@example.com", first_name: "John", last_name: "Doe" }
        }.to change(User, :count).by(1)
        expect(last_response.status).to eq(200)
        expect(json["id"]).to be_a(String)
        expect(json["username"]).to eq("foobar")
      end
    end

    context "invalid params" do
      it "returns validation errors" do
        expect {
          post_json "/api/users", { username: "fo", password: "pass", email: "foobarXXexample.com" }
        }.to change(User, :count).by(0)
        expect(last_response.status).to eq(422)
        expect(json["error_code"]).to eq("VALIDATION_ERROR")
        expect(json["errors"]).to include("Username is too short (minimum is 3 characters)")
        expect(json["errors"]).to include("Email is invalid")
      end
    end
  end

  describe "GET /api/users/current" do
    before { auth }

    it "gets the current user information" do
      get_json "/api/users/current"
      expect(last_response.status).to eq(200)
      expect(json["username"]).to eq(@user.username)
    end
  end
end
