class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :destroy_session

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def destroy_session
    request.session_options[:skip] = true
  end

  private
    def record_not_found(error)
      render json: { error: error.message }, status: :not_found
    end
end