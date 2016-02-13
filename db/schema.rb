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

ActiveRecord::Schema.define(version: 20160213054509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "claims", force: :cascade do |t|
    t.integer  "gid"
    t.string   "tnrtpcd"
    t.string   "ttltpdsc"
    t.string   "tnrsbtpcd"
    t.float    "prcntowner"
    t.string   "ntrtmstmp"
    t.string   "tnrsbtpdsc"
    t.string   "owner_name"
    t.string   "trmntntpds"
    t.string   "tag_number"
    t.integer  "objectid"
    t.string   "gdtdt"
    t.string   "ntrsrd"
    t.string   "claim_name"
    t.integer  "num_owners"
    t.integer  "clientnum"
    t.string   "issue_date"
    t.string   "protected"
    t.string   "pdtsrd"
    t.string   "pdttmstmp"
    t.string   "tnrtpdscrp"
    t.integer  "tnrnmbrd"
    t.integer  "rvsnnmbr"
    t.string   "fcode"
    t.string   "trmntndt"
    t.float    "rnhctrs"
    t.string   "ttltpcd"
    t.geometry "geom",       limit: {:srid=>4326, :type=>"multi_polygon"}
  end

  add_index "claims", ["geom"], name: "index_claims_on_geom", using: :gist

end
