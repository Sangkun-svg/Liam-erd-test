ActiveRecord::Schema[8.0].define(version: 2025_11_19_000001) do
  enable_extension "btree_gin"
  enable_extension "plpgsql"

  create_table "schedule_activities", force: :cascade do |t|
    t.string   "address"
    t.string   "bookcategory"
    t.decimal  "bookingfee"
    t.boolean  "canBook"
    t.string   "category"
    t.text     "content"
    t.text     "contents", array: true, default: []
    t.integer  "day"
    t.bigint   "fk_reservationScheduleBook_id"
    t.integer  "index"
    t.float    "latitude"
    t.float    "longtitude"
    t.integer  "programIndex"
    t.string   "title"

    t.bigint   "creator_id"

    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.text     "contentRestore"

    t.index ["creator_id"], name: "index_schedule_activities_on_creator_id"
    t.index ["fk_reservationScheduleBook_id"], name: "index_schedule_activities_on_fk_reservationschedulebook_id"
  end

    create_table "schedule_days", force: :cascade do |t|
    t.string   "category"                          # scheduleCategory
    t.date     "date"                              # date
    t.integer  "day"                               # number
    t.bigint   "programIndex"                      # number
    t.string   "title"                             # text

    t.bigint   "creator_id"                        # Built-in Creator(User)
    t.string   "slug"                              # Built-in Slug
    t.datetime "created_at", null: false           # Built-in Created Date
    t.datetime "updated_at", null: false           # Built-in Modified Date

    # List of ScheduleActivitys
    t.bigint   "fk_ScheduleActivity_ids", array: true, default: []

    # Restore field (Bubble 자동 생성)
    t.text     "dayRestore"

    t.index ["creator_id"], name: "index_schedule_days_on_creator_id"
    t.index ["fk_ScheduleActivity_ids"], name: "index_schedule_days_on_fk_scheduleactivity_ids"
  end


  create_table "schedulepermissions", force: :cascade do |t|
    t.bigint   "fk_ScheduleProgram_id"
    t.bigint   "fk_user_id"
    t.string   "permission"

    t.bigint   "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "schedule_programs", force: :cascade do |t|
    t.string   "color"
    t.text     "content"
    t.text     "Duration"
    t.bigint   "fk_Scedule_day_ids", array: true, default: []
    t.integer  "index"
    t.integer  "Price"
    t.string   "ScheduleCategory"
    t.text     "subTitle"
    t.text     "t"
    t.text     "title"

    t.bigint   "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.text     "fk_Scedule_ProgramRestore"
    t.text     "scheulecategoryRestore"
  end

  create_table "schedule_user_regists", force: :cascade do |t|
    t.integer  "days"
    t.bigint   "fk_scheduleProgram_id"
    t.bigint   "fk_userid_id"
    t.integer  "place"

    t.bigint   "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end


  
end
