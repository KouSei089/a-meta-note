# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_25_000904) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "color", null: false
    t.string "color_code", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "category_task_bases", force: :cascade do |t|
    t.bigint "task_basis_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_task_bases_on_category_id"
    t.index ["task_basis_id"], name: "index_category_task_bases_on_task_basis_id"
  end

  create_table "schedule_bases", force: :cascade do |t|
    t.string "title", null: false
    t.string "pattren", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_schedule_bases_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.date "title", null: false
    t.string "pattren", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "task_bases", force: :cascade do |t|
    t.string "title", null: false
    t.string "category_name", null: false
    t.time "time_start", null: false
    t.time "time_end", null: false
    t.integer "percent", null: false
    t.bigint "schedule_basis_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_basis_id"], name: "index_task_bases_on_schedule_basis_id"
    t.index ["user_id"], name: "index_task_bases_on_user_id"
  end

  create_table "task_categories", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_task_categories_on_category_id"
    t.index ["task_id"], name: "index_task_categories_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", null: false
    t.string "category_name", null: false
    t.time "time_start", null: false
    t.time "time_end", null: false
    t.integer "percent", null: false
    t.bigint "schedule_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_tasks_on_schedule_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "categories", "users"
  add_foreign_key "category_task_bases", "categories"
  add_foreign_key "category_task_bases", "task_bases"
  add_foreign_key "schedule_bases", "users"
  add_foreign_key "schedules", "users"
  add_foreign_key "task_bases", "schedule_bases"
  add_foreign_key "task_bases", "users"
  add_foreign_key "task_categories", "categories"
  add_foreign_key "task_categories", "tasks"
  add_foreign_key "tasks", "schedules"
  add_foreign_key "tasks", "users"
end
