class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
    def record_not_found
      render status: :not_found, json: { success: false, errors: "No such shortened url found in record!" }      
    end
end
