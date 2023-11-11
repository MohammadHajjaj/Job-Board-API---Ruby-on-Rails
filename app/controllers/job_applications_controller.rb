class JobApplicationsController < ApplicationController
    before_action :set_job_application, only: [:show]
    before_action :authenticate_user!
    load_and_authorize_resource
    # GET /job_applications
    def index
      @job_applications = JobApplication.all
      render json: @job_applications
    end
  
    # GET /job_applications/:id
    def show
        @job_application = JobApplication.find(params[:id])
              if current_user.admin?
          @job_application.update(status: 'Seen')
        end
      
        render json: @job_application
      end
        
    # POST /job_applications
    def create
        @job_application = current_user.job_applications.new(job_application_params)

        if @job_application.save
          render json: @job_application, status: :created, location: @job_application
        else
          render json: @job_application.errors, status: :unprocessable_entity
        end
      end
      
    private
      def set_job_application
        @job_application = JobApplication.find(params[:id])
      end
  
      def job_application_params
        params.require(:job_application).permit(:other, :permitted, :attributes)
    end
  end
  