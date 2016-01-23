class Trip < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates_associated :user
  scope :destination, -> (destination) { where("lower(destination) like ?", "%#{destination.downcase}%")}
  scope :comment, -> (comment) { where("lower(comment) like ?", "%#{comment.downcase}%")}
  scope :starts_after, -> (date) { where("start_date >= ?", date)}
  scope :ends_before, -> (date) { where("enddate <= ?", date)}
end
