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

ActiveRecord::Schema.define(version: 2019_07_08_181424) do

  create_table "net_promoter_scores", force: :cascade do |t|
    t.integer "score", null: false
    t.string "touchpoint", null: false
    t.string "respondent_type"
    t.integer "respondent_id"
    t.string "object_type"
    t.integer "object_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["object_id", "object_type"], name: "index_net_promoter_scores_on_object_id_and_object_type"
    t.index ["object_type", "object_id"], name: "index_net_promoter_scores_on_object_type_and_object_id"
    t.index ["respondent_id", "respondent_type"], name: "index_net_promoter_scores_on_respondent_id_and_respondent_type"
    t.index ["respondent_type", "respondent_id"], name: "index_net_promoter_scores_on_respondent_type_and_respondent_id"
    t.index ["touchpoint", "respondent_id", "respondent_type", "object_id", "object_type"], name: "net_promoter_scores_data_integrity", unique: true
    t.index ["touchpoint"], name: "index_net_promoter_scores_on_touchpoint"
  end

  create_table "realtors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
