class JobApplication < ApplicationRecord
  belongs_to :job_post, optional: true  # Make the job_post association optional
  belongs_to :user     # Make the user association optional
  # Set default status
  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= 'Not Seen'
  end

  validates :status, presence: true
end
