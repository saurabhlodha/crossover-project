class Request < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates_associated :user
  enum status: [:open, :processing, :closed]
end
