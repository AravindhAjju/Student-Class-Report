require "application_system_test_case"

class SubjectScoresTest < ApplicationSystemTestCase
  setup do
    @subject_score = subject_scores(:one)
  end

  test "visiting the index" do
    visit subject_scores_url
    assert_selector "h1", text: "Subject Scores"
  end

  test "creating a Subject score" do
    visit subject_scores_url
    click_on "New Subject Score"

    fill_in "Scrore", with: @subject_score.scrore
    click_on "Create Subject score"

    assert_text "Subject score was successfully created"
    click_on "Back"
  end

  test "updating a Subject score" do
    visit subject_scores_url
    click_on "Edit", match: :first

    fill_in "Scrore", with: @subject_score.scrore
    click_on "Update Subject score"

    assert_text "Subject score was successfully updated"
    click_on "Back"
  end

  test "destroying a Subject score" do
    visit subject_scores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subject score was successfully destroyed"
  end
end
