class CreateShortUris < ActiveRecord::Migration[5.0]
  def change
    create_table :short_uris do |t|
      t.string :original_url
      t.string :shorty
      t.integer :user_id
      t.integer :short_visits_count

      t.timestamps
    end
    add_index :short_uris, :user_id
  end
end
