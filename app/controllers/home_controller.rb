class HomeController < ApplicationController
  def index
  	@posts = Post.order("created_at DESC").limit(3)
  	@lists = Post.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
  	@lists.drop(3)
  end
end
