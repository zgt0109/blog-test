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
    respond_to do |format|
      format.html
      format.json{ render json: @topic }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json{ render json: @topic }
      format.js
    end
  end

  def create
  	@topic = current_user.topics.build(params[:topic])
    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic }
        format.json { render json: @topic, status: :created }
        format.js
      else
        format.html { render 'new' }
        format.json { render json: @topic.errors }
        format.js
      end
    end
  	
  end

  def edit
  end

  def update
    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic }
        format.json { head :no_content }
      else
        format.html { render 'edit' }
        format.json { render json: @topic.errors }
      end
    end
  end

  def destroy
  	@topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_path }
      format.json { head :no_content }
    end
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
