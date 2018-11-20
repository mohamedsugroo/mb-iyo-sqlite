json.extract! site, :id, :name, :logo, :baseUrl, :created_at, :updated_at
json.url site_url(site, format: :json)
