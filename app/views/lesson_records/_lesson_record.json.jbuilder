json.extract! lesson_record, :id, :chapter_id, :word_id, :user_id, :created_at, :updated_at
json.url lesson_record_url(lesson_record, format: :json)
