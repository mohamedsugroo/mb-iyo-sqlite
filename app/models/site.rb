class Site < ApplicationRecord

	has_attached_file :logo, styles: { 
		large: "1080x720>",medium: "300x300>", thumb: "100x100>"
	}, default_url: "/images/:style/missing.png"

	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

	def photo_id
		self.logo.url(:medium)
	end

end
