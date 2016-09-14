class DiseasesController < ApplicationController
  before_filter :find_disease, only: [:show, :edit, :update, :destroy]
	def index
		@diseases = Disease.all
	end

	def new
		@disease = Disease.new
	end

	def create
		@disease = Disease.new(params[:disease])
		if @disease.save
			redirect_to @disease
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @disease.update(params[:disease])
			redirect_to @disease
		else
			render 'edit'
		end
	end

	def destroy
		@disease.destroy
		redirect_to diseases_path
	end

	private
		def find_disease
			@disease = Disease.get(params[:id])
		end
end