class ShortVisit < ApplicationRecord

	belongs_to :short_uri, counter_cache: true
	
end
