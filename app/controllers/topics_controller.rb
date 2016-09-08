class TopicsController < ApplicationController

	before_filter :find_topic, only: [:show, :edit, :update, :destroy]

  def index
  	@topics = current_user.topics.all
  end

  def show

  end

  def new
  	@topic = Topic.new
  end

  def create
  	@topic = current_user.topics.build(params[:topic])
  	if @topic.save
  		redirect_to @topic
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @topic.update_attributes(params[:topic])
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
  		@topic = Topic.find params[:id]
  	end
end
