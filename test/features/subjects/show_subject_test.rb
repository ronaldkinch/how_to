require "test_helper"

feature "Show Subjects" do
  before(:all) do
    @subject = subjects(:one)
    visit subject_path(@subject)
  end

  scenario "show subject page has links" do
    page.must_have_link "Add Step"
    page.must_have_link "Edit Steps"
    page.must_have_link "Edit Subject"
    page.must_have_link "Back"
  end

  scenario "subject page has subject" do
    page.must_have_content @subject.name
    page.must_have_content steps(:step_one).title
  end
end
