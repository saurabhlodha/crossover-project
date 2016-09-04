class RequestSerializer < ActiveModel::Serializer
  attributes :id, :request_id, :description, :status, :user_id
end
