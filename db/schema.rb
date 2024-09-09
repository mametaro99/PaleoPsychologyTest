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

ActiveRecord::Schema[7.1].define(version: 2024_09_08_090327) do
  create_table "questions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "test_id", null: false
    t.string "question_text", null: false
    t.boolean "reverse_score", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "test_answer_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "test_answer_id", null: false
    t.integer "score"
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_test_answer_details_on_question_id"
    t.index ["test_answer_id"], name: "index_test_answer_details_on_test_answer_id"
  end

  create_table "test_answers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "test_id", null: false
    t.integer "count", null: false
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_test_answers_on_test_id"
    t.index ["user_id", "test_id", "count"], name: "index_test_answers_on_user_id_and_test_id_and_count", unique: true
    t.index ["user_id"], name: "index_test_answers_on_user_id"
  end

  create_table "tests", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "min_score", null: false
    t.integer "max_score", null: false
    t.float "avg_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "questions", "tests"
  add_foreign_key "test_answer_details", "questions"
  add_foreign_key "test_answer_details", "test_answers"
  add_foreign_key "test_answers", "tests"
  add_foreign_key "test_answers", "users"
end
