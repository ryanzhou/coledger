require 'rails_helper'

describe "Projects Features", js: true do
  before do
    auth
  end

  describe "listing projects" do
    let!(:project) { create(:project, owner: @user) }
    let!(:membership) { create(:membership, user: @user, role: :editor) }

    it "shows a list of projects" do
      visit '#/'
      expect(page).to have_content("Projects")
      expect(page).to have_content(project.name)
      expect(page).to have_content(membership.project.name)
    end
  end

  describe "create a project" do
    before do
      create(:project, owner: @user)
    end

    let(:project_name) { Faker::Company.name }

    it "adds a project to the list" do
      visit '#/'
      within '#createProjectForm' do
        fill_in "Project Name", with: project_name
        select "AUD", from: "currency"
      end
      click_button "Create Project"
      expect(page).to have_content(project_name)
      expect(page).to have_content("Australian Dollar")
    end
  end
end
