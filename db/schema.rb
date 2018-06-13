# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180613041838) do

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.string "post_code", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_addresses_on_address"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "family_name_kanji", null: false
    t.string "given_name_kanji", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.boolean "is_main_administer", default: false, null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_admins_on_created_at"
    t.index ["email"], name: "index_admins_on_email"
    t.index ["family_name_kana"], name: "index_admins_on_family_name_kana"
    t.index ["family_name_kanji"], name: "index_admins_on_family_name_kanji"
    t.index ["given_name_kana"], name: "index_admins_on_given_name_kana"
    t.index ["given_name_kanji"], name: "index_admins_on_given_name_kanji"
    t.index ["is_deleted"], name: "index_admins_on_is_deleted"
    t.index ["is_main_administer"], name: "index_admins_on_is_main_administer"
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["updated_at"], name: "index_admins_on_updated_at"
  end

  create_table "artists", force: :cascade do |t|
    t.integer "track_id", null: false
    t.string "name", null: false
    t.string "name_kana", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_artists_on_name"
    t.index ["name_kana"], name: "index_artists_on_name_kana"
    t.index ["track_id"], name: "index_artists_on_track_id"
  end

  create_table "disc_numbers", force: :cascade do |t|
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_english", null: false
    t.string "genre_kana", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_english"], name: "index_genres_on_genre_english"
    t.index ["genre_kana"], name: "index_genres_on_genre_kana"
  end

  create_table "items", force: :cascade do |t|
    t.integer "item_review_id"
    t.integer "track_id", null: false
    t.integer "disc_number_id", null: false
    t.integer "label_id", null: false
    t.integer "artist_id", null: false
    t.integer "genre_id", null: false
    t.text "item_introduction"
    t.string "title", null: false
    t.text "image_id", null: false
    t.integer "stock", null: false
    t.integer "price_without_tax", null: false
    t.string "type", null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_items_on_artist_id"
    t.index ["disc_number_id"], name: "index_items_on_disc_number_id"
    t.index ["genre_id"], name: "index_items_on_genre_id"
    t.index ["item_review_id"], name: "index_items_on_item_review_id"
    t.index ["label_id"], name: "index_items_on_label_id"
    t.index ["title"], name: "index_items_on_title"
    t.index ["track_id"], name: "index_items_on_track_id"
  end

  create_table "labels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "payment_method", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_method"], name: "index_payments_on_payment_method"
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "disc_number_id", null: false
    t.integer "number", null: false
    t.string "name", null: false
    t.integer "length_hour", default: 0, null: false
    t.integer "length_minute", null: false
    t.integer "length_second", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disc_number_id"], name: "index_tracks_on_disc_number_id"
    t.index ["name"], name: "index_tracks_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "cart_item_id"
    t.integer "order_id"
    t.string "family_name_kanji", null: false
    t.string "given_name_kanji", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "phone_number", null: false
    t.string "post_code", null: false
    t.string "address", null: false
    t.integer "member_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_item_id"], name: "index_users_on_cart_item_id"
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["family_name_kana"], name: "index_users_on_family_name_kana"
    t.index ["family_name_kanji"], name: "index_users_on_family_name_kanji"
    t.index ["given_name_kana"], name: "index_users_on_given_name_kana"
    t.index ["given_name_kanji"], name: "index_users_on_given_name_kanji"
    t.index ["member_status"], name: "index_users_on_member_status"
    t.index ["order_id"], name: "index_users_on_order_id"
    t.index ["phone_number"], name: "index_users_on_phone_number"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["updated_at"], name: "index_users_on_updated_at"
  end

end
