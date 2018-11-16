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

ActiveRecord::Schema.define(version: 2018_11_13_160434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatars", force: :cascade do |t|
    t.string "name", null: false
    t.integer "reputation", default: 10, null: false
    t.boolean "active", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_avatars_on_user_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.string "avatar_throw"
    t.string "target_throw"
    t.bigint "avatar_id"
    t.integer "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar_id"], name: "index_challenges_on_avatar_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "body", null: false
    t.bigint "avatar_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar_id"], name: "index_comments_on_avatar_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.bigint "challenge_id"
    t.bigint "avatar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar_id"], name: "index_messages_on_avatar_id"
    t.index ["challenge_id"], name: "index_messages_on_challenge_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.string "body", null: false
    t.bigint "avatar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar_id"], name: "index_posts_on_avatar_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "direction", null: false
    t.string "content_type"
    t.bigint "content_id"
    t.bigint "avatar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar_id"], name: "index_votes_on_avatar_id"
    t.index ["content_type", "content_id"], name: "index_votes_on_content_type_and_content_id"
  end

  add_foreign_key "messages", "challenges"
end
