class CommentsController < ApplicationController
	http_basic_authenticate_with :name => 'zgt', :password => '123456', :only => :destroy
	def create
		@post = Post.find params[:post_id]
		@comment = @post.comments.create params[:comment]
		redirect_to :back
	end

	def destroy
		@post = Post.find params[:post_id]
		@comment = @post.comments.find params[:id]
		@comment.destroy
		redirect_to post_path(@post)
	end
end
