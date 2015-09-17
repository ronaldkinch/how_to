require 'test_helper'

feature "Visit Index Page" do
  scenario "the index page links to subjects" do
    visit root_path
    page.must_have_content "How To Subjects"
    click_on "How To Subjects"
    current_path.must_equal subjects_path
  end
end
