class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
    def record_not_found
      render status: :not_found, json: { errors: "No such shortened url found in record!" }      
    end
end
