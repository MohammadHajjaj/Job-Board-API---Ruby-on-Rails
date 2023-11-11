class JobPostsController < ApplicationController
    before_action :set_job_post, only: [:show, :update, :destroy]
    before_action :authenticate_user!
    load_and_authorize_resource
    # GET /job_posts
    def index
      @job_posts = JobPost.all
      render json: @job_posts
    end
  
    # GET /job_posts/:id
    def show
      render json: @job_post
    end

    # POST /job_posts
    def create
        @job_post = current_user.job_posts.new(job_post_params)
        if @job_post.save
          render json: @job_post, status: :created, location: @job_post
        else
          render json: @job_post.errors, status: :unprocessable_entity
        end
      end
        
    # PATCH/PUT /job_posts/:id
    def update
      if @job_post.update(job_post_params)
        render json: @job_post
      else
        render json: @job_post.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /job_posts/:id
    def destroy
      @job_post.destroy
    end
  
    private
      def set_job_post
        @job_post = JobPost.find(params[:id])
      end
  
      def job_post_params
        params.require(:job_post).permit(:title, :description)
      end
  end
  