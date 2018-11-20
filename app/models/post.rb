class Post < ApplicationRecord

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
end
