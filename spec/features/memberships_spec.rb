require 'rails_helper'

describe "Memberships Features", js: true do
  before do
    auth
  end

  describe "listing members" do
    let(:project) { create(:project, owner: @user) }
    let(:user_1) { create(:user) }
    let(:user_2) { create(:user) }

    before do
      create(:membership, project: project, user: user_1)
      create(:membership, project: project, user: user_2)
    end

    it "lists all members in the project" do
      visit "/projects/#{project.id}"
      click_link "Members"
      expect(page).to have_content(@user.username)
      expect(page).to have_content(user_1.username)
      expect(page).to have_content(user_2.username)
    end
  end

  describe "update membership role" do
    let(:project) { create(:project, owner: @user) }
    let(:user_1) { create(:user) }
    let(:user_2) { create(:user) }

    before do
      @membership_1 = create(:membership, project: project, user: user_1, role: :editor)
      @membership_2 = create(:membership, project: project, user: user_2, role: :viewer)
    end

    it "updates the role of the member" do
      visit "/projects/#{project.id}"
      click_link "Members"
      within "#membership-#{@membership_1.id}" do
        choose "Admin"
      end
      expect(page).to have_content("The role of @#{user_1.username} in this project has been changed to admin")
      expect(Membership.find(@membership_1.id).role).to eq(:admin)
      within "#membership-#{@membership_2.id}" do
        choose "Editor"
      end
      expect(page).to have_content("The role of @#{user_2.username} in this project has been changed to editor")
      expect(Membership.find(@membership_2.id).role).to eq(:editor)
    end
  end

  describe "invite member" do
    let(:project) { create(:project, owner: @user) }
    let(:other_user) { create(:user) }

    it "adds the member to the project as viewer" do
      visit "/projects/#{project.id}"
      click_link "Members"
      fill_in "Enter username...", with: other_user.username[0,2]
      expect(page).to have_content(other_user.username)
      click_link other_user.username
      click_button "Add to this project"
      expect(page).to have_content("@#{other_user.username} has been added to this project")
      expect(Membership.last.user.id).to eq(other_user.id)
      expect(Membership.last.role).to eq(:viewer)
    end
  end
end
