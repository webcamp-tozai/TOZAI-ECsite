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

ActiveRecord::Schema.define(version: 20180610104040) do

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
