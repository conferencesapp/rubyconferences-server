json.array!(@conferences) do |conference|
  json.partial! conference
end
