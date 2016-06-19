class ShortVisitSerializer < ActiveModel::Serializer
  attributes :id, :short_uri_id, :visitor_ip, :visitor_city, :visitor_state, :visitor_country_iso2
end
