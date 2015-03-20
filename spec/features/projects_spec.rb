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
    let(:description) { Faker::Company.catch_phrase }

    it "adds a project to the list" do
      visit '#/'
      click_link "New Project"
      within '#createProjectForm' do
        fill_in "Project Name", with: project_name
        fill_in "Description", with: description
        select "AUD", from: "currency"
      end
      click_button "Create Project"
      expect(page).to have_content(project_name)
      expect(page).to have_content(description)
    end
  end

  describe "view a project" do
    let!(:project) { create(:project, owner: @user) }

    it "shows the project name and description" do
      visit '#/'
      click_link project.name
      expect(page).to have_content(project.name)
      expect(page).to have_content(project.description)
    end
  end
end
