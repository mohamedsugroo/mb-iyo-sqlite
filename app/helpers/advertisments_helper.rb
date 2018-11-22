module AdvertismentsHelper

	def advertisment(jscode)
		content_for(:advertisment) { jscode }
	end

	def randadvert
		Advertisment.order("RANDOM()").limit(1)
	end

end
