require 'test_helper'

class LearningRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learning_record = learning_records(:one)
  end

  test "should get index" do
    get learning_records_url
    assert_response :success
  end

  test "should get new" do
    get new_learning_record_url
    assert_response :success
  end

  test "should create learning_record" do
    assert_difference('LearningRecord.count') do
      post learning_records_url, params: { learning_record: { chapter_id: @learning_record.chapter_id, user_id: @learning_record.user_id, word_id: @learning_record.word_id } }
    end

    assert_redirected_to learning_record_url(LearningRecord.last)
  end

  test "should show learning_record" do
    get learning_record_url(@learning_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_learning_record_url(@learning_record)
    assert_response :success
  end

  test "should update learning_record" do
    patch learning_record_url(@learning_record), params: { learning_record: { chapter_id: @learning_record.chapter_id, user_id: @learning_record.user_id, word_id: @learning_record.word_id } }
    assert_redirected_to learning_record_url(@learning_record)
  end

  test "should destroy learning_record" do
    assert_difference('LearningRecord.count', -1) do
      delete learning_record_url(@learning_record)
    end

    assert_redirected_to learning_records_url
  end
end
