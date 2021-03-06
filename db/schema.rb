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

ActiveRecord::Schema.define(version: 2019_07_23_190555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_muscles", force: :cascade do |t|
    t.bigint "exercise_id"
    t.bigint "muscle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_muscles_on_exercise_id"
    t.index ["muscle_id"], name: "index_exercise_muscles_on_muscle_id"
  end

  create_table "exercise_records", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "exercise_id"
    t.integer "num_reps"
    t.integer "weight"
    t.integer "num_sets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_records_on_exercise_id"
    t.index ["user_id"], name: "index_exercise_records_on_user_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_records", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "meal_id"
    t.integer "num_servings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_meal_records_on_meal_id"
    t.index ["user_id"], name: "index_meal_records_on_user_id"
  end

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

  create_table "muscles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "token"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
