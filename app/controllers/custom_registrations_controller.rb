class CustomRegistrationsController < DeviseTokenAuth::RegistrationsController
    def create
      super do |resource|
        resource.skip_confirmation! if resource.respond_to?(:skip_confirmation!)
      end
    end
  end
  