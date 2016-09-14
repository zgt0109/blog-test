class TopicsController < ApplicationController

	before_filter :find_topic, only: [:show, :edit, :update, :destroy]

  def index
  	@topics = current_user.topics.page params[:page]
  end

  def show

  end

  def new
  	@topic = Topic.new
  end

  def create
  	@topic = current_user.topics.new(params[:topic])
  	if @topic.save
  		redirect_to @topic
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @topic.update(params[:topic])
  		redirect_to @topic
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@topic.destroy
  	redirect_to topics_path
  end

  private	
  	def find_topic
  		@topic = Topic.get(params[:id])
  	end
end
