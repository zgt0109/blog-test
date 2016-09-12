class TopicsController < ApplicationController

	before_filter :find_topic, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_token
  def index
  	@topics = current_user.topics.page(params[:page]) 
    respond_to do |format|
      format.html
      format.json { render json: @topics }
    end
  end

  def show

  end

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
  	@topic = current_user.topics.build(params[:topic])
    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic }
        format.js
      else
        format.html { render 'new' }
        format.js
      end
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

  protected
    def authenticate_token
      @current_user = User.where(auth_token: request.headers['token']).first
      render nothing: true, status: 401 unless @current_user
    end

  private	
  	def find_topic
  		@topic = Topic.find params[:id]
  	end
end
