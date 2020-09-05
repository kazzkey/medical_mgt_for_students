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

ActiveRecord::Schema.define(version: 2020_09_04_075203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "checks", force: :cascade do |t|
    t.float "height"
    t.float "body_weight"
    t.float "sitting_height"
    t.float "naked_eyesight"
    t.float "corrected_eyesight"
    t.integer "hearing"
    t.integer "urine"
    t.integer "electro_cardiogram"
    t.integer "nutritional_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_student_id"
    t.bigint "user_officer_id"
    t.index ["user_officer_id"], name: "index_checks_on_user_officer_id"
    t.index ["user_student_id"], name: "index_checks_on_user_student_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contact_id"
    t.bigint "user_student_id"
    t.bigint "user_officer_id"
    t.index ["contact_id"], name: "index_comments_on_contact_id"
    t.index ["user_officer_id"], name: "index_comments_on_user_officer_id"
    t.index ["user_student_id"], name: "index_comments_on_user_student_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.bigint "user_student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_officer_id"
    t.boolean "release", default: false, null: false
    t.index ["user_officer_id"], name: "index_contacts_on_user_officer_id"
    t.index ["user_student_id"], name: "index_contacts_on_user_student_id"
  end

  create_table "user_officers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "type", null: false
    t.integer "school_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_user_officers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_user_officers_on_reset_password_token", unique: true
  end

  create_table "user_students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "student_id", null: false
    t.integer "school_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birth_date"
    t.integer "grade"
    t.integer "blood_type"
    t.index ["email"], name: "index_user_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_user_students_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "checks", "user_officers"
  add_foreign_key "checks", "user_students"
  add_foreign_key "comments", "contacts"
  add_foreign_key "comments", "user_officers"
  add_foreign_key "comments", "user_students"
  add_foreign_key "contacts", "user_officers"
  add_foreign_key "contacts", "user_students"
end
