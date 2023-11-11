class JobPost < ApplicationRecord
    belongs_to :user
    has_many :job_applications, dependent: :destroy
  
    validates :title, :description, presence: true
  end
  