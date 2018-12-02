class SearchesController < ApplicationController
  
  def index
  	@posts = if params[:term]
  		Post.where('title LIKE ?', "%#{params[:term]}%")
  	else
  		Post.all
  	end

  	render json: @posts
  end


end
