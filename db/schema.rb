# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161130160002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "external_links", force: :cascade do |t|
    t.string   "link_type"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.integer  "catsone_id"
    t.string   "title"
    t.string   "location"
    t.text     "description"
    t.text     "notes"
    t.integer  "recruiter_id"
    t.integer  "owner_id"
    t.string   "category_name"
    t.boolean  "is_hot"
    t.date     "start_date"
    t.string   "salary"
    t.string   "duration"
    t.integer  "openings"
    t.string   "external_id"
    t.integer  "company_id"
    t.string   "contact_id"
    t.integer  "status_id"
    t.string   "type"
    t.json     "links"
    t.json     "embedded"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "company_name"
    t.string   "company_type"
    t.boolean  "public"
    t.string   "role"
  end

  create_table "mona_articles", force: :cascade do |t|
    t.string   "url",        default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.string   "email"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "title"
    t.string   "snippet"
    t.string   "skill_one"
    t.string   "skill_one_blurb"
    t.string   "skill_two"
    t.string   "skill_two_blurb"
    t.string   "skill_three"
    t.string   "skill_three_blurb"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "priority"
    t.boolean  "active",            default: true
    t.string   "header_pic"
    t.string   "profile_pic"
    t.string   "skill_one_icon"
    t.string   "skill_two_icon"
    t.string   "skill_three_icon"
    t.string   "slug"
    t.string   "other_image"
  end

  add_index "people", ["slug"], name: "index_people_on_slug", unique: true, using: :btree

end
