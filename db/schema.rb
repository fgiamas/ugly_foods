# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_30_145742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.date "pick_up_date"
    t.bigint "user_id", null: false
    t.float "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "produce_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_selections", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "cart_id", null: false
    t.integer "units"
    t.integer "kg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_product_selections_on_cart_id"
    t.index ["product_id"], name: "index_product_selections_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "discount_percent"
    t.integer "price_per_unit"
    t.integer "lifespan"
    t.bigint "shop_id", null: false
    t.integer "total_units"
    t.integer "total_kg"
    t.boolean "sold_status", default: false
    t.integer "days_to_expiry"
    t.bigint "produce_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.string "status"
    t.index ["produce_type_id"], name: "index_products_on_produce_type_id"
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.text "content"
    t.bigint "shop_id", null: false
    t.bigint "user_id", null: false
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_ratings_on_shop_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "website"
    t.string "address"
    t.string "post_code"
    t.string "city"
    t.string "country"
    t.string "phone_number"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "post_code"
    t.string "city"
    t.string "country"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "users"
  add_foreign_key "product_selections", "carts"
  add_foreign_key "product_selections", "products"
  add_foreign_key "products", "produce_types"
  add_foreign_key "products", "shops"
  add_foreign_key "ratings", "shops"
  add_foreign_key "ratings", "users"
  add_foreign_key "shops", "users"
end
