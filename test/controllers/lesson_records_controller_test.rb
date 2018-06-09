require 'test_helper'

class LessonRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_record = lesson_records(:one)
  end

  test "should get index" do
    get lesson_records_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_record_url
    assert_response :success
  end

  test "should create lesson_record" do
    assert_difference('LessonRecord.count') do
      post lesson_records_url, params: { lesson_record: { chapter_id: @lesson_record.chapter_id, user_id: @lesson_record.user_id, word_id: @lesson_record.word_id } }
    end

    assert_redirected_to lesson_record_url(LessonRecord.last)
  end

  test "should show lesson_record" do
    get lesson_record_url(@lesson_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_record_url(@lesson_record)
    assert_response :success
  end

  test "should update lesson_record" do
    patch lesson_record_url(@lesson_record), params: { lesson_record: { chapter_id: @lesson_record.chapter_id, user_id: @lesson_record.user_id, word_id: @lesson_record.word_id } }
    assert_redirected_to lesson_record_url(@lesson_record)
  end

  test "should destroy lesson_record" do
    assert_difference('LessonRecord.count', -1) do
      delete lesson_record_url(@lesson_record)
    end

    assert_redirected_to lesson_records_url
  end
end
