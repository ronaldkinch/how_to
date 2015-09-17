require "test_helper"

feature "Visit Edit Steps Page" do
  before(:all) do
    @subject = subjects(:one)
    @step = steps(:step_one)
    visit edit_subject_step_path(@subject, @step)
  end

  scenario "edit steps page links" do
    page.must_have_link "Back"
  end

  scenario "edit a valid step" do
    fill_in "Title", with: "Test Step"
    fill_in "Detail", with: "How to instruction"
    click_on "Update Step"
    page.must_have_content "Test Step"
  end

  scenario "fail to edit an invalid subject" do
    fill_in "Title", with: ""
    fill_in "Detail", with: "How to fail"
    click_on "Update Step"
    page.must_have_content "prohibited this step from being saved"
    page.must_have_content "Title can't be blank"
  end
end
