require 'httparty'
require 'sanitize'
require 'nokogiri'
require 'resolv-replace'

namespace :blogs do
  desc "TODO"
  task wordpress: :environment do

    sites = Site.all

    sites.each do |site|

        blog = Wordpress.new(site.baseUrl)
        posts = blog.posts

        posts.each do |post|

            title = post["title"]["rendered"]
            puts title
            content = post["content"]["rendered"]

            youtube_transformer = lambda do |env|
                node      = env[:node]
                node_name = env[:node_name]

                # Don't continue if this node is already whitelisted or is not an element.
                return if env[:is_whitelisted] || !node.element?

                # Don't continue unless the node is an iframe.
                return unless node_name == 'iframe'

                # Verify that the video URL is actually a valid YouTube video URL.
                return unless node['src'] =~ %r|\A(?:https?:)?//(?:www\.)?youtube(?:-nocookie)?\.com/|

                # We're now certain that this is a YouTube embed, but we still need to run
                # it through a special Sanitize step to ensure that no unwanted elements or
                # attributes that don't belong in a YouTube embed can sneak in.
                Sanitize.node!(node, {
                    :elements => %w[iframe],
                    :attributes => {
                        'iframe'  => %w[allowfullscreen frameborder height src width]
                    }
                })

                # Now that we're sure that this is a valid YouTube embed and that there are
                # no unwanted elements or attributes hidden inside it, we can tell Sanitize
                # to whitelist the current node.
                {:node_whitelist => [node]}
            end

            new_Content = Sanitize.fragment(content, Sanitize::Config.merge(Sanitize::Config::RELAXED,
                    :add_attributes => {
                        'a' => {'rel' => 'nofollow'}
                    },
                    :transformers => youtube_transformer
                ))


            newContent = Nokogiri::HTML::DocumentFragment.parse(new_Content)
            newContent.xpath('//@style').remove  rescue ""
            newContent.xpath('//@width').remove  rescue ""
            newContent.xpath('//@height').remove  rescue ""
            newContent.xpath("//img").each do |img|
                img.set_attribute("width" , "height")
                puts img, "Images"
            end


            source_link = post["link"]
            tags = post["tags"]
            categories = post["categories"]
            hash_tags = []
            hash_categories = []
            published = post["date"]
            author = site.baseUrl + "users/" + post["author"].to_s
            new_author = HTTParty.get(author)
            user = new_author.parsed_response["name"]
            user_link = new_author.parsed_response["link"]
            user_avatars = new_author["avatar_urls"]
            new_user_avatar = []

            if user_avatars
                user_avatars.each do |av|
                    new_user_avatar.push av.last
                    # puts av.last
                end
            end

            tags.each do |t|
                tage_site = site.baseUrl + "tags/" + t.to_s
                new_tags = HTTParty.get(tage_site)
                hash_tags.push new_tags.parsed_response["name"]
            end

            categories.each do |cat|
                category = site.baseUrl + "categories/" + cat.to_s
                new_cat = HTTParty.get(category)
                hash_categories.push new_cat.parsed_response["name"] rescue ""
            end

            hash_tags.to_json
            

            post_type = post["format"]

            featured_media = post["featured_media"]
            media_link = site.baseUrl + "media/" + featured_media.to_s
            featuredImage = HTTParty.get(media_link)
            photo = featuredImage.parsed_response["guid"]["rendered"] rescue ""
            # puts categories
            
            Post.create!(
                title: title, 
                content: newContent,
                site_id: site.id,
                featuredmedia: photo,
                author_name: user,
                author_avatar: @avatar,
                tags: hash_tags,
                author: user,
                author_avatars: new_user_avatar,
                source_link: source_link,
                post_type: post_type,
                category: hash_categories
            )
        end

    end

  end
end


class Wordpress
    def initialize(url)
        @url = url
    end

    def posts
        posts_url = @url+'posts'
        request = HTTParty.get(posts_url)
        return request.parsed_response
    end

    def self.print_site
        return @url
    end
    
end
