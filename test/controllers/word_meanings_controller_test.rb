require 'test_helper'

class WordMeaningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @word_meaning = word_meanings(:one)
  end

  test "should get index" do
    get word_meanings_url
    assert_response :success
  end

  test "should get new" do
    get new_word_meaning_url
    assert_response :success
  end

  test "should create word_meaning" do
    assert_difference('WordMeaning.count') do
      post word_meanings_url, params: { word_meaning: { character: @word_meaning.character, meaning: @word_meaning.meaning, word_id: @word_meaning.word_id } }
    end

    assert_redirected_to word_meaning_url(WordMeaning.last)
  end

  test "should show word_meaning" do
    get word_meaning_url(@word_meaning)
    assert_response :success
  end

  test "should get edit" do
    get edit_word_meaning_url(@word_meaning)
    assert_response :success
  end

  test "should update word_meaning" do
    patch word_meaning_url(@word_meaning), params: { word_meaning: { character: @word_meaning.character, meaning: @word_meaning.meaning, word_id: @word_meaning.word_id } }
    assert_redirected_to word_meaning_url(@word_meaning)
  end

  test "should destroy word_meaning" do
    assert_difference('WordMeaning.count', -1) do
      delete word_meaning_url(@word_meaning)
    end

    assert_redirected_to word_meanings_url
  end
end
