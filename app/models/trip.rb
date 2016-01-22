class Trip < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates_associated :user
end
