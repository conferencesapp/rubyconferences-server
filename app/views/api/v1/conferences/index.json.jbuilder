json.array!(@conferences) do |conference|
  json.partial! conference
  json.url api_v1_conference_url(conference, format: :json)
end
