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

ActiveRecord::Schema.define(version: 2018_05_03_193145) do

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "cname"
    t.string "caddress"
    t.string "ccontactn"
    t.string "ccontactp"
    t.string "cpayment"
    t.string "cnotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inflow_product_quantities", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "inflow_id"
    t.bigint "product_id"
    t.integer "iquantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inflow_id"], name: "index_inflow_product_quantities_on_inflow_id"
    t.index ["product_id"], name: "index_inflow_product_quantities_on_product_id"
  end

  create_table "inflows", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "sreceipt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
  end

  create_table "order_product_quantities", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "oquantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_product_quantities_on_order_id"
    t.index ["product_id"], name: "index_order_product_quantities_on_product_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "total", default: 0, null: false
    t.boolean "status", null: false
    t.bigint "customer_id", null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.string "receipt", limit: 50, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "outflow_product_quantities", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "outflow_id"
    t.bigint "product_id"
    t.integer "oquantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["outflow_id"], name: "index_outflow_product_quantities_on_outflow_id"
    t.index ["product_id"], name: "index_outflow_product_quantities_on_product_id"
  end

  create_table "outflows", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "creceipt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.string "receipt"
    t.index ["customer_id"], name: "index_outflows_on_customer_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "supplier_id", null: false
    t.string "pname"
    t.string "price"
    t.string "unit"
    t.integer "reorder"
    t.string "loc"
    t.integer "currquantity"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "supplier_id"
  end

  create_table "purchases", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_purchases_on_email", unique: true
    t.index ["reset_password_token"], name: "index_purchases_on_reset_password_token", unique: true
  end

  create_table "sales", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_sales_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sales_on_reset_password_token", unique: true
  end

  create_table "suppliers", primary_key: "supplier_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "sname"
    t.text "saddress"
    t.text "scontactn"
    t.text "scontactp"
    t.text "spayment"
    t.text "snotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inflow_product_quantities", "inflows"
  add_foreign_key "inflow_product_quantities", "products"
  add_foreign_key "order_product_quantities", "orders"
  add_foreign_key "order_product_quantities", "products"
  add_foreign_key "orders", "customers"
  add_foreign_key "outflow_product_quantities", "outflows"
  add_foreign_key "outflow_product_quantities", "products"
  add_foreign_key "outflows", "customers"
  add_foreign_key "products", "suppliers", primary_key: "supplier_id", name: "products_ibfk_1"
end
