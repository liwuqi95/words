require 'test_helper'

class ChapterWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chapter_word = chapter_words(:one)
  end

  test "should get index" do
    get chapter_words_url
    assert_response :success
  end

  test "should get new" do
    get new_chapter_word_url
    assert_response :success
  end

  test "should create chapter_word" do
    assert_difference('ChapterWord.count') do
      post chapter_words_url, params: { chapter_word: { chapter_id: @chapter_word.chapter_id, word_id: @chapter_word.word_id } }
    end

    assert_redirected_to chapter_word_url(ChapterWord.last)
  end

  test "should show chapter_word" do
    get chapter_word_url(@chapter_word)
    assert_response :success
  end

  test "should get edit" do
    get edit_chapter_word_url(@chapter_word)
    assert_response :success
  end

  test "should update chapter_word" do
    patch chapter_word_url(@chapter_word), params: { chapter_word: { chapter_id: @chapter_word.chapter_id, word_id: @chapter_word.word_id } }
    assert_redirected_to chapter_word_url(@chapter_word)
  end

  test "should destroy chapter_word" do
    assert_difference('ChapterWord.count', -1) do
      delete chapter_word_url(@chapter_word)
    end

    assert_redirected_to chapter_words_url
  end
end
