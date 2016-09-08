class CasesController < ApplicationController
	before_filter :find_case, only: [:show, :edit, :update, :destroy]
	def index
		@cases = Case.all
	end

	def new
		@case = Case.new
	end

	def create
		@case = Case.new(params[:case])
		if @case.save
			redirect_to @case
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @case.update_attributes(params[:case])
			redirect_to @case
		else
			render 'edit'
		end
	end

	def destroy
		@case.destroy
		redirect_to cases_path
	end

	private
		def find_case
			@case = Case.find(params[:id])
		end
end