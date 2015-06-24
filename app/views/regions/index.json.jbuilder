json.array!(@regions) do |region|
  json.extract! region, :id, :string
  json.url region_url(region, format: :json)
end
