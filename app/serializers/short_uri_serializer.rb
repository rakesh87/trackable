class ShortUriSerializer < ActiveModel::Serializer
  attributes :id, :original_url, :shorty, :user_id, :short_visits_count
end
