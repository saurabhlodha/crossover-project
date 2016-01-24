class Trip < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates_associated :user
  scope :destination, -> (destination) { where("lower(destination) like ?", "%#{destination.downcase}%").order(:destination)}
  scope :comment, -> (comment) { where("lower(comment) like ?", "%#{comment.downcase}%").order(:destination)}
  scope :starts_after, -> (date) { where("start_date >= ?", date).order(:start_date)}
  scope :ends_before, -> (date) { where("end_date <= ?", date).order(:end_date)}
end
