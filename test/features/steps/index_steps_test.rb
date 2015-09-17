require "test_helper"

feature "Show Steps of Subject" do
  before(:all) do
    @subject = subjects(:one)
    visit subject_steps_path(@subject)
  end

  scenario "show steps page has links" do
    page.must_have_link "New Step"
    page.must_have_link "Back"
    page.wont_have_link "Show"
    page.must_have_link "Edit"
    page.must_have_link "Destroy"
  end

  scenario "steps index has subject steps" do
    page.must_have_content subjects(:one).name
    page.must_have_content steps(:step_one).title
  end

  scenario "steps index wont have other subject steps" do
    page.wont_have_content steps(:step_three).title
  end

  scenario "deleting from the steps index" do
    page.must_have_content steps(:step_one).title
    page.must_have_content "Destroy"
    find("a[href='#{subject_step_path(@subject, steps(:step_one))}'][data-method='delete']").click
    page.wont_have_content steps(:step_one).title
  end
end
