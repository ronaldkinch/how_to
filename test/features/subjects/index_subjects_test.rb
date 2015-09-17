require "test_helper"

feature "Show Subjects" do
  before(:all) do
    visit subjects_path
  end

  scenario "show subjects page has links" do
    page.must_have_link "New Subject"
    page.must_have_link "Show"
    page.must_have_link "Edit"
    page.must_have_link "Destroy"
  end

  scenario "subjects index has subjects" do
    page.must_have_content subjects(:one).name
  end

  scenario "deleting from the subjects index" do
    page.must_have_content subjects(:one).name
    page.must_have_content "Destroy"
    find("a[href='#{subject_path(subjects(:one))}'][data-method='delete']").click
    page.wont_have_content subjects(:one).name
  end
end
