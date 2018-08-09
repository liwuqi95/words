require 'test_helper'

class QuizRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz_record = quiz_records(:one)
  end

  test "should get index" do
    get quiz_records_url
    assert_response :success
  end

  test "should get new" do
    get new_quiz_record_url
    assert_response :success
  end

  test "should create quiz_record" do
    assert_difference('QuizRecord.count') do
      post quiz_records_url, params: { quiz_record: { quiz_id: @quiz_record.quiz_id, word_id: @quiz_record.word_id } }
    end

    assert_redirected_to quiz_record_url(QuizRecord.last)
  end

  test "should show quiz_record" do
    get quiz_record_url(@quiz_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_quiz_record_url(@quiz_record)
    assert_response :success
  end

  test "should update quiz_record" do
    patch quiz_record_url(@quiz_record), params: { quiz_record: { quiz_id: @quiz_record.quiz_id, word_id: @quiz_record.word_id } }
    assert_redirected_to quiz_record_url(@quiz_record)
  end

  test "should destroy quiz_record" do
    assert_difference('QuizRecord.count', -1) do
      delete quiz_record_url(@quiz_record)
    end

    assert_redirected_to quiz_records_url
  end
end
