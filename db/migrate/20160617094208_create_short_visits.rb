class CreateShortVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :short_visits do |t|
      t.integer :short_uri_id
      t.string :visitor_ip
      t.string :visitor_city
      t.string :visitor_state
      t.string :visitor_country_iso2

      t.timestamps
    end
    add_index :short_visits, :short_uri_id
  end
end
