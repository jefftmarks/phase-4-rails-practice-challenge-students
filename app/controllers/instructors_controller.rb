class InstructorsController < ApplicationController
	def index
		render json: Instructor.all
	end

	def show
		instructor = set_instructor
		render json: instructor, status: :ok
	end

	def create
		instructor = Instructor.create!(instructor_params)
		render json: instructor, status: :created
	end

	def update
		instructor = set_instructor
		if instructor.update(instructor_params)
			render json: instructor
		else
			render json: { error: instructor.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def destroy
		instructor = set_instructor
		instructor.destroy
		head :no_content
	end

	private

	def instructor_params
		params.permit(:name)
	end

	def set_instructor
		Instructor.find(params[:id])
	end
end
