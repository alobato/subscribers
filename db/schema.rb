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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130402063559) do

  create_table "campaigns", :force => true do |t|
    t.integer  "list_id"
    t.string   "name"
    t.string   "from"
    t.string   "reply_to"
    t.string   "subject"
    t.text     "body"
    t.text     "body_txt"
    t.datetime "schedule_for"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "deliveries", :force => true do |t|
    t.integer  "subscriber_id"
    t.integer  "campaign_id"
    t.integer  "list_id"
    t.string   "email"
    t.string   "token"
    t.datetime "opened_at"
    t.datetime "clicked_at"
    t.datetime "unsubscribed_at"
    t.datetime "bounced_at"
    t.string   "ip_address"
    t.string   "user_agent"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "lists", :force => true do |t|
    t.string   "name"
    t.string   "string_custom_field_1_name"
    t.string   "string_custom_field_2_name"
    t.string   "string_custom_field_3_name"
    t.string   "integer_custom_field_1_name"
    t.string   "integer_custom_field_2_name"
    t.string   "integer_custom_field_3_name"
    t.string   "datetime_custom_field_1_name"
    t.string   "datetime_custom_field_2_name"
    t.string   "datetime_custom_field_3_name"
    t.integer  "rating"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "subscribers", :force => true do |t|
    t.integer  "list_id"
    t.string   "name"
    t.string   "email"
    t.date     "birthday"
    t.string   "status"
    t.datetime "last_activity"
    t.integer  "rating"
    t.string   "language"
    t.text     "history"
    t.string   "string_custom_field_1"
    t.string   "string_custom_field_2"
    t.string   "string_custom_field_3"
    t.integer  "integer_custom_field_1"
    t.integer  "integer_custom_field_2"
    t.integer  "integer_custom_field_3"
    t.datetime "datetime_custom_field_1"
    t.datetime "datetime_custom_field_2"
    t.datetime "datetime_custom_field_3"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

end
