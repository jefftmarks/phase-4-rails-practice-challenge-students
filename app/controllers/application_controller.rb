class ApplicationController < ActionController::API
	rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
	rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
	rescue_from ActionController::ParameterMissing, with: :render_parameter_missing_reponse

	private

	def render_not_found_response(exception)
		render json: { error: "#{exception.model} not found" }, status: :not_found
	end

	def render_unprocessable_entity_response(exception)
		render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
	end

	def render_parameter_missing_reponse(exception)
		render json: { error: "Instructor required" }, status: :unprocessable_entity
	end
end
