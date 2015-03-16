require 'rails_helper'

describe "Sessions Requests" do
  describe "POST /sessions" do
    before do
      create(:user, username: "test_user", password: "password001")
    end

    context "correct credentials" do
      it "signs in the user and returns a new token" do
        post_json "/sessions", { username: "test_user", password: "password001" }
        expect(last_response.status).to eq(200)
        expect(json["token"]).to be_a(String)
      end
    end

    context "incorrect credentials" do
      it "responds 401" do
        post_json "/sessions", { username: "test_user", password: "password002" }
        expect(last_response.status).to eq(401)
        expect(json["error_code"]).to eq("AUTHENTICATION_ERROR")
      end
    end
  end

  describe "GET /sessions/current" do
    before { auth }

    context "valid token" do
      it "returns the current session information" do
        get_json "/sessions/current"
        expect(last_response.status).to eq(200)
        expect(json["id"]).to be_a(String)
      end
    end

    context "invalid/expired token" do
      before do
        @session.delete
      end

      it "responds 401" do
        get_json "/sessions/current"
        expect(last_response.status).to eq(401)
      end
    end
  end

  describe "DELETE /sessions/current" do
    before { auth }

    it "destroys the current session" do
      expect{
        delete_json "/sessions/current"
      }.to change(Session, :count).by(-1)
      expect(last_response.status).to eq(200)
      expect{ @session.reload }.to raise_error(Mongoid::Errors::DocumentNotFound)
    end
  end
end
