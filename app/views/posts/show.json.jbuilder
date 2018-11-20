json.partial! "posts/post", post: @post

json.related_articles @relatedposts.each do |post|
  json.title post.title
  json.tags post.new_tags 
  json.url post_url(post, format: :json)
end