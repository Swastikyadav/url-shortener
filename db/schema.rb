ActiveRecord::Schema.define(version: 2020_05_12_103558) do

  create_table "links", force: :cascade do |t|
    t.string "url"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_links_on_slug", unique: true
    t.index ["url"], name: "index_links_on_url", unique: true
  end

end
