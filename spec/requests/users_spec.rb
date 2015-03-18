require 'rails_helper'

describe "Users Requests" do
  describe "POST /users" do
    context "valid params" do
      it "signs up a user" do
        expect {
          post_json "/users", { username: "foobar", password: "passw0rd", email: "foobar@example.com", first_name: "John", last_name: "Doe" }
        }.to change(User, :count).by(1)
        expect(last_response.status).to eq(200)
        expect(json["id"]).to be_a(String)
        expect(json["username"]).to eq("foobar")
      end
    end

    context "invalid params" do
      it "returns validation errors" do
        expect {
          post_json "/users", { username: "fo", password: "pass", email: "foobarXXexample.com" }
        }.to change(User, :count).by(0)
        expect(last_response.status).to eq(422)
        expect(json["error_code"]).to eq("VALIDATION_ERROR")
        expect(json["errors"]["username"]).to eq(["is too short (minimum is 3 characters)"])
        expect(json["errors"]["email"]).to eq(["is invalid"])
      end
    end
  end

  describe "GET /users/current" do
    before { auth }

    it "gets the current user information" do
      get_json "/users/current"
      expect(last_response.status).to eq(200)
      expect(json["username"]).to eq(@user.username)
    end
  end
end
