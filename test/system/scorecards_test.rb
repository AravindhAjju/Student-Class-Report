require "application_system_test_case"

class ScorecardsTest < ApplicationSystemTestCase
  setup do
    @scorecard = scorecards(:one)
  end

  test "visiting the index" do
    visit scorecards_url
    assert_selector "h1", text: "Scorecards"
  end

  test "creating a Scorecard" do
    visit scorecards_url
    click_on "New Scorecard"

    fill_in "Grade", with: @scorecard.grade
    click_on "Create Scorecard"

    assert_text "Scorecard was successfully created"
    click_on "Back"
  end

  test "updating a Scorecard" do
    visit scorecards_url
    click_on "Edit", match: :first

    fill_in "Grade", with: @scorecard.grade
    click_on "Update Scorecard"

    assert_text "Scorecard was successfully updated"
    click_on "Back"
  end

  test "destroying a Scorecard" do
    visit scorecards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scorecard was successfully destroyed"
  end
end
