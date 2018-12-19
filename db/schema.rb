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

ActiveRecord::Schema.define(version: 2018_12_19_224654) do

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.string "serving_size"
    t.integer "kcal"
    t.integer "total_fat"
    t.integer "sat_fat"
    t.integer "polyun_fat"
    t.integer "monoun_fat"
    t.integer "cholesterol"
    t.integer "sodium"
    t.integer "potassium"
    t.integer "total_carb"
    t.integer "fiber"
    t.integer "sugar"
    t.integer "protein"
    t.integer "vitamin_a"
    t.integer "calcium"
    t.integer "vitamin_d"
    t.integer "vitamin_c"
    t.integer "iron"
    t.integer "magnesium"
    t.integer "cobalamin"
    t.integer "vitamin_b6"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
