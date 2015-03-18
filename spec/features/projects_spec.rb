require 'rails_helper'

describe "Projects Features", js: true do
  before do
    auth
  end

  describe "listing projects" do
    before do
      create(:project, user: @user)
    end

    it "shows a list of projects" do
      visit '#/'
      expect(page).to have_content("Projects")
      expect(page).to have_content("The Monopoly Game")
    end
  end

  describe "create a project" do
    before do
      create(:project, user: @user)
    end

    it "adds a project to the list" do
      visit '#/'
      within '#createProjectForm' do
        fill_in "Project name", with: "Zoo of Money"
      end
      click_button "Create Project"
      expect(page).to have_content("Zoo of Money")
    end
  end
end