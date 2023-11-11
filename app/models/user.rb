class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  include DeviseTokenAuth::Concerns::User
  before_create :set_default_role

  
  def admin?
    role == 'admin'
  end
  
  private
  def set_default_role
    self.role ||= 'job_seeker'
  end

  # Association with JobPosts and JobApplications
  has_many :job_posts, dependent: :destroy
  has_many :job_applications, dependent: :destroy
end
