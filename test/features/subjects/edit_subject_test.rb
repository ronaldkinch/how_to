require "test_helper"

feature "Edit Subject" do
  before(:all) do
    subject = subjects(:one)
    visit edit_subject_path(subject)
  end

  scenario "edit subject page has links" do
    page.must_have_link "Show"
    page.must_have_link "Back"
  end

  scenario "edit a subject" do
    fill_in "Name", with: "Test Name"
    click_on "Update Subject"
    page.must_have_content "Test Name"
  end

  scenario "invalid edit data" do
    fill_in "Name", with: ""
    click_on "Update Subject"
    page.must_have_content "prohibited this subject from being saved"
    page.must_have_content "Name can't be blank"
  end
end
