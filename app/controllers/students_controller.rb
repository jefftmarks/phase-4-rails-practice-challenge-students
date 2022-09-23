class StudentsController < ApplicationController
	def index
		render json: Student.all
	end

	def show
		student = set_student
		render json: student, status: :ok
	end

	def create
		student = Student.create!(student_params)
		render json: student, status: :created
	end

	def update
		student = set_student
		if student.update(student_params)
			render json: student
		else
			render json: { error: student.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def destroy
		student = set_student
		student.destroy
		head :no_content
	end

	private

	def student_params
		params.require(:instructor).permit(:name, :age, :instructor)
	end

	def set_student
		Student.find(params[:id])
	end
end
