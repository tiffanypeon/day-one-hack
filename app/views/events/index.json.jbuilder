json.array!(@events) do |event|
  json.extract! event, :id, :content_source, :content, :person, :abuse_flag, :content_created_at
  json.url event_url(event, format: :json)
end
