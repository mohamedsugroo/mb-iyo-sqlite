class Post < ApplicationRecord
	include ActionView::Helpers::DateHelper

	def new_tags 
		JSON.parse(self.tags)
	end

	def catagories
		JSON.parse(self.category)
	end

	def new_author_avatars
		JSON.parse(self.author_avatars)
	end

	def sites
		Site.where(id: self.site_id).first
	end

	def sites_json
		site = Site.where(id: self.site_id).first

		return [site.name, site.photo_id]
	end

	def time_ago
		time_ago_in_words(self.created_at)
	end



	private

	  def generate_slug
	    if self.slug.present? && self.slug == title.parameterize
	      self.slug
	    else
	      self.slug = title.parameterize
	    end
	  end
end
