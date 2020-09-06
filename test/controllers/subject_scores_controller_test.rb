require 'test_helper'

class SubjectScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject_score = subject_scores(:one)
  end

  test "should get index" do
    get subject_scores_url
    assert_response :success
  end

  test "should get new" do
    get new_subject_score_url
    assert_response :success
  end

  test "should create subject_score" do
    assert_difference('SubjectScore.count') do
      post subject_scores_url, params: { subject_score: { scrore: @subject_score.scrore } }
    end

    assert_redirected_to subject_score_url(SubjectScore.last)
  end

  test "should show subject_score" do
    get subject_score_url(@subject_score)
    assert_response :success
  end

  test "should get edit" do
    get edit_subject_score_url(@subject_score)
    assert_response :success
  end

  test "should update subject_score" do
    patch subject_score_url(@subject_score), params: { subject_score: { scrore: @subject_score.scrore } }
    assert_redirected_to subject_score_url(@subject_score)
  end

  test "should destroy subject_score" do
    assert_difference('SubjectScore.count', -1) do
      delete subject_score_url(@subject_score)
    end

    assert_redirected_to subject_scores_url
  end
end
