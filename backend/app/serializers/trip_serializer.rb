class TripSerializer < ActiveModel::Serializer
  attributes :id, :destination, :start_date, :end_date, :comment
  has_one :user

  def attributes
    data = super
    data[:user_id]    = object.user.id
    data[:user_email] = object.user.email
    data
  end
end
