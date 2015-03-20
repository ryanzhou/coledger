require 'rails_helper'

describe "Memberships Requests" do
  before { auth }

  describe "POST /projects/:project_id/memberships" do
    let(:user) { create(:user) }

    context "with admin permissions" do
      let(:project) { create(:project, owner: @user) }

      it "creates a membership" do
        post_json "/projects/#{project.id}/memberships", { username: user.username, role: "editor" }
        expect(last_response.status).to eq(200)
        expect(json["id"]).to be_a(String)
        expect(json["user"]["username"]).to eq(user.username)
      end

      context "user already added" do
        it "returns a validation error" do
          post_json "/projects/#{project.id}/memberships", { username: user.username, role: "editor" }
          post_json "/projects/#{project.id}/memberships", { username: user.username, role: "editor" }
          expect(last_response.status).to eq(422)
          expect(json["errors"][0]).to eq("User is already taken")
        end
      end
    end

    context "with no permission" do
      let(:project) { create(:project) } # someone else's project
      let!(:membership) { create(:membership, role: :editor, user: @user, project: project)}

      it "returns 404" do
        post_json "/projects/#{project.id}/memberships", { username: user.username }
        expect(last_response.status).to eq(404)
        expect(json["error_code"]).to eq("DOCUMENT_NOT_FOUND")
      end
    end
  end
end
