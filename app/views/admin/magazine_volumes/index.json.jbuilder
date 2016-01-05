json.array!(@magazine_volumes) do |magazine_volume|
  json.extract! magazine_volume, :id, :number, :published
  json.url magazine_volume_url(magazine_volume, format: :json)
end
