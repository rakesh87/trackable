
ActiveRecord::Schema.define(version: 20160619050403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "short_uris", force: :cascade do |t|
    t.string   "original_url"
    t.string   "shorty"
    t.integer  "user_id"
    t.integer  "short_visits_count"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_short_uris_on_user_id", using: :btree
  end

  create_table "short_visits", force: :cascade do |t|
    t.integer  "short_uri_id"
    t.string   "visitor_ip"
    t.string   "visitor_city"
    t.string   "visitor_state"
    t.string   "visitor_country_iso2"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["short_uri_id"], name: "index_short_visits_on_short_uri_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "api_token"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["api_token"], name: "index_users_on_api_token", unique: true, using: :btree
  end

end
