class Request < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates_associated :user
  enum status: [:open, :processing, :closed]
  scope :description, -> (description) { where("lower(description) like ?", "%#{description.downcase}%").order(:description)}
  scope :status, -> (status) { where(:status => "#{status.downcase}").order(:description)}
end
