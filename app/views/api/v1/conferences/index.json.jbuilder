json.array!(@conferences) do |conference|
  json.extract!(
    conference,
    :id,
    :name,
    :location,
    :twitter_username,
    :image_url,
    :start_date,
    :end_date,
    :website,
    :when
  )
end
