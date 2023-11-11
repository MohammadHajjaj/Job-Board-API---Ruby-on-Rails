class ApplicationController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken
    rescue_from CanCan::AccessDenied do |exception|
        render json: { error: "Access Denied" }, status: :forbidden
      end
    
  end
  