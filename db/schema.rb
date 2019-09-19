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

ActiveRecord::Schema.define(version: 2019_08_12_230012) do

  create_table "compounds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagrams", force: :cascade do |t|
    t.string "name"
    t.string "bpm_diagram_code"
    t.float "constraint_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", force: :cascade do |t|
    t.string "time"
    t.string "quantity"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_information_on_resource_id"
  end

  create_table "notations", force: :cascade do |t|
    t.string "name"
    t.string "resource"
    t.integer "compound_id"
    t.integer "can_handle_id"
    t.integer "can_produce_id"
    t.boolean "is_constraint"
    t.string "bpm_notation_code"
    t.integer "dependencies_id"
    t.integer "diagram_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["can_handle_id"], name: "index_notations_on_can_handle_id"
    t.index ["can_produce_id"], name: "index_notations_on_can_produce_id"
    t.index ["compound_id"], name: "index_notations_on_compound_id"
    t.index ["dependencies_id"], name: "index_notations_on_dependencies_id"
    t.index ["diagram_id"], name: "index_notations_on_diagram_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
