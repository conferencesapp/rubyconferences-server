json.array!(@conferences) do |conference|
  json.extract!(
    conference,
    :id,
    :name,
    :location,
    :twitter_username,
    :start_date,
    :end_date,
    :website,
    :when,
    :logos,
    :latitude,
    :longitude
  )
end
