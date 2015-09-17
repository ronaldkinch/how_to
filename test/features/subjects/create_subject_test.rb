require "test_helper"

feature "Create Subject" do
  before(:all) do
    visit new_subject_path
  end

  scenario "create subject page has links" do
    page.must_have_link "Back"
  end

  scenario "create a valid subject" do
    fill_in "Name", with: "Subject 3"
    fill_in "Description", with: "How to 3"
    click_on "Create Subject"
    page.must_have_content "Subject 3"
  end

  scenario "fail to create an invalid subject" do
    fill_in "Description", with: "How to fail"
    click_on "Create Subject"
    current_path.must_equal subjects_path
    page.must_have_content "prohibited this subject from being saved"
    page.must_have_content "Name can't be blank"
  end
end
