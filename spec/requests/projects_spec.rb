require 'rails_helper'

describe "Projects Requests" do
  before { auth }

  describe "GET /projects" do
    before do
      create(:project, owner: @user)
      create(:membership, user: @user)
    end

    it "returns a list of joined projects" do
      get_json "/projects"
      expect(last_response.status).to eq(200)
      expect(json.size).to eq(2)
      expect(json[0]["id"]).to be_a(String)
    end
  end

  describe "POST /projects" do
    context "valid project" do
      it "creates a project" do
        post_json "/projects", { name: "Test Project", currency: "USD" }
        expect(last_response.status).to eq(200)
        expect(json["id"]).to be_a(String)
        expect(json["name"]).to eq("Test Project")
        expect(json["currency"]["id"]).to eq("usd")
      end

      it "creates a membership" do
        expect {
          post_json "/projects", { name: "Test Project", currency: "USD" }
        }.to change(Membership, :count).by(1)
        expect(Membership.last.role).to eq(:admin)
      end
    end

    context "invalid project" do
      it "returns the validation error" do
        post_json "/projects", { name: "Test Project", currency: "XXX" }
        expect(last_response.status).to eq(422)
        expect(json["errors"]).to include("Currency is not included in the list")
      end
    end
  end
end
