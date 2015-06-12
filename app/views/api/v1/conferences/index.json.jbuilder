json.array!(@conferences) do |conference|
  json.partial! conference.becomes(Conference)
end
