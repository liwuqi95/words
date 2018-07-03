json.extract! test_record, :id, :word_id, :user_id, :chapter_id, :correct, :created_at, :updated_at
json.url test_record_url(test_record, format: :json)
