json.array!(@play_styles) do |play_style|
  json.extract! play_style, :id, :name
  json.url admin_play_style_url(play_style, format: :json)
end
