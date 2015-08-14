json.array!(@mounts) do |mount|
  json.extract! mount, :id, :name
  json.url mount_url(mount, format: :json)
end
