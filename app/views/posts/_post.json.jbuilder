json.extract! post, :id, :title, :sites_json, :featuredmedia, :author_name, :new_tags, :catagories, :author, :new_author_avatars, :source_link, :post_type, :content, :created_at, :updated_at, :time_ago
json.url post_url(post, format: :json)
json.url_html post_url(post)