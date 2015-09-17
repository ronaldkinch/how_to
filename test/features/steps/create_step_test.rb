require "test_helper"

feature "Visit Create Steps Page" do
  before(:all) do
    @subject = subjects(:one)
    visit new_subject_step_path(@subject)
  end

  scenario "create steps page links" do
    page.must_have_link "Back"
    click_on "Back"
    current_path.must_equal subject_path(@subject)
  end

  scenario "create a valid step" do
    fill_in "Title", with: "Test Step"
    fill_in "Detail", with: "How to instruction"
    click_on "Create Step"
    page.must_have_content "Test Step"
  end

  scenario "fail to create an invalid step" do
    fill_in "Detail", with: "How to fail"
    click_on "Create Step"
    page.must_have_content "prohibited this step from being saved"
    page.must_have_content "Title can't be blank"
  end
end
