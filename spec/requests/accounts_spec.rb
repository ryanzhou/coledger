require 'rails_helper'

describe "Accounts Requests" do
  before { auth }

  describe "GET /api/projects/:id/accounts" do
    let(:project) { create(:project, owner: @user) }

    before do
      create(:account, project: project)
      create(:account, project: project, account_type: :expense)
    end

    it "returns a list of accounts" do
      get_json "/api/projects/#{project.id}/accounts"
      expect(last_response.status).to eq(200)
      expect(json.count).to eq(2)
      expect(json[0]["id"]).to be_a(String)
    end
  end
end
