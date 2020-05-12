ActiveRecord::Schema.define(version: 2020_05_12_094539) do

  create_table "links", force: :cascade do |t|
    t.string "url"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
