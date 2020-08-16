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

ActiveRecord::Schema.define(version: 2020_08_14_004959) do

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "report_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "public_id"
    t.string "box_width"
    t.string "box_height"
    t.string "box_left"
    t.string "box_top"
    t.integer "age_low"
    t.integer "age_high"
    t.string "eyeglasses"
    t.string "eyeglass_con"
    t.string "gender"
    t.string "gender_con"
    t.string "beard"
    t.string "beard_con"
    t.string "mustache"
    t.string "mustache_con"
    t.string "eyeLeft"
    t.string "eyeRight"
    t.string "mouthLeft"
    t.string "mouthRight"
    t.string "nose"
    t.string "leftEyeBrowLeft"
    t.string "leftEyeBrowRight"
    t.string "leftEyeBrowUp"
    t.string "rightEyeBrowLeft"
    t.string "rightEyeBrowRight"
    t.string "rightEyeBrowUp"
    t.string "leftEyeLeft"
    t.string "leftEyeDown"
    t.string "rightEyeLeft"
    t.string "rightEyeRight"
    t.string "rightEyeUp"
    t.string "rightEyeDown"
    t.string "noseLeft"
    t.string "noseRight"
    t.string "mouthUp"
    t.string "mouthDown"
    t.string "leftPupil"
    t.string "rightPupil"
    t.string "upperJawlineLeft"
    t.string "midJawlineLeft"
    t.string "chinBottom"
    t.string "midJawlineRight"
    t.string "upperJawlineRight"
    t.string "brightness"
    t.string "sharpness"
    t.string "compare_result"
    t.string "label"
    t.integer "user_id", null: false
    t.integer "report_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "leftEyeRight"
    t.string "leftEyeUp"
    t.string "confidence"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "address"
    t.string "telephone_number"
    t.text "summary"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "suspect_data"
    t.text "vehicle_data"
    t.string "incident_date"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "location"
    t.integer "neighborhood_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["neighborhood_id"], name: "index_users_on_neighborhood_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "plate"
    t.string "color"
    t.text "background"
    t.integer "user_id"
    t.integer "report_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "year"
    t.string "url"
    t.string "public_id"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "images", "users"
  add_foreign_key "reports", "users"
  add_foreign_key "users", "neighborhoods"
end
