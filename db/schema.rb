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

ActiveRecord::Schema.define(version: 20140519012208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crawler_1_pages", force: true do |t|
    t.string   "url",                             null: false
    t.integer  "depth",           default: 0,     null: false
    t.boolean  "queued",          default: false, null: false
    t.datetime "last_fetched_at"
    t.datetime "refetch_after"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "crawler_1_pages", ["queued"], name: "index_crawler_1_pages_on_queued", using: :btree
  add_index "crawler_1_pages", ["refetch_after"], name: "index_crawler_1_pages_on_refetch_after", using: :btree
  add_index "crawler_1_pages", ["url"], name: "index_crawler_1_pages_on_url", unique: true, using: :btree

  create_table "crawler_1_responses", force: true do |t|
    t.integer  "page_id"
    t.string   "effective_url"
    t.string   "response_code"
    t.text     "response_headers"
    t.integer  "content_length"
    t.string   "body"
    t.decimal  "total_time"
    t.integer  "redirect_count"
    t.string   "primary_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "crawler_1_responses", ["page_id"], name: "index_crawler_1_responses_on_page_id", using: :btree

  create_table "crawlers", force: true do |t|
    t.string   "name"
    t.text     "seed_urls"
    t.boolean  "enabled",    default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crawlers_scrapers", id: false, force: true do |t|
    t.integer "crawler_id"
    t.integer "scraper_id"
  end

  add_index "crawlers_scrapers", ["crawler_id", "scraper_id"], name: "index_crawlers_scrapers_on_crawler_id_and_scraper_id", unique: true, using: :btree

  create_table "crawlers_spiders", id: false, force: true do |t|
    t.integer "crawler_id"
    t.integer "spider_id"
  end

  add_index "crawlers_spiders", ["crawler_id", "spider_id"], name: "index_crawlers_spiders_on_crawler_id_and_spider_id", unique: true, using: :btree

  create_table "friendly_id_slugs", force: true do |t|
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

  create_table "ingestors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingestors_scrapers", id: false, force: true do |t|
    t.integer "ingestor_id"
    t.integer "scraper_id"
  end

  add_index "ingestors_scrapers", ["ingestor_id", "scraper_id"], name: "index_ingestors_scrapers_on_ingestor_id_and_scraper_id", unique: true, using: :btree

  create_table "ingstor_1_items", force: true do |t|
    t.integer  "crawler_id"
    t.integer  "response_id"
    t.text     "data"
    t.boolean  "archived",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingstor_1_items", ["crawler_id"], name: "index_ingstor_1_items_on_crawler_id", using: :btree
  add_index "ingstor_1_items", ["response_id"], name: "index_ingstor_1_items_on_response_id", using: :btree

  create_table "scrapers", force: true do |t|
    t.string   "name"
    t.text     "definition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spiders", force: true do |t|
    t.string   "name"
    t.text     "definition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
