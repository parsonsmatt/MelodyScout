json.array!(@releases) do |release|
  json.extract! release, :id, :name, :description, :date
  json.url release_url(release, format: :json)
end
