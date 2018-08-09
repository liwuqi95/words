json.extract! quiz_record, :id, :quiz_id, :word_id, :created_at, :updated_at
json.url quiz_record_url(quiz_record, format: :json)
