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

ActiveRecord::Schema.define(version: 2019_09_27_005235) do

  create_table "compounds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagrams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "bpm_diagram_code"
    t.float "constraint_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "time"
    t.string "quantity"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_information_on_resource_id"
  end

  create_table "notations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "resource"
    t.bigint "compound_id"
    t.bigint "can_handle_id"
    t.bigint "can_produce_id"
    t.boolean "is_constraint"
    t.string "bpm_notation_code"
    t.bigint "diagram_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["can_handle_id"], name: "index_notations_on_can_handle_id"
    t.index ["can_produce_id"], name: "index_notations_on_can_produce_id"
    t.index ["compound_id"], name: "index_notations_on_compound_id"
    t.index ["diagram_id"], name: "index_notations_on_diagram_id"
  end

  create_table "related_notations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "notation_id"
    t.integer "related_notation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "information", "resources"
  add_foreign_key "notations", "compounds"
  add_foreign_key "notations", "information", column: "can_handle_id"
  add_foreign_key "notations", "information", column: "can_produce_id"
end
