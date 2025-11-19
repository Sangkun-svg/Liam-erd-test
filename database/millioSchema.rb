ActiveRecord::Schema[8.0].define(version: 2025_11_19_000001) do
  enable_extension "btree_gin"
  enable_extension "plpgsql"

  create_table "ScheduleActivity", force: :cascade do |t|
    t.string   "address"
    t.string   "bookcategory"
    t.decimal  "bookingfee"
    t.boolean  "canBook"
    t.string   "category"
    t.text     "content"
    t.text     "contents", array: true, default: []
    t.integer  "day"
    t.bigint   "fk_reservationScheduleBook"
    t.integer  "index"
    t.float    "latitude"
    t.float    "longtitude"
    t.integer  "programIndex"
    t.string   "title"

    t.bigint   "Creator"
    t.datetime "Modified Date"
    t.datetime "Created Date"
    t.string   "Slug"
    t.text     "contentRestore"
  end


  create_table "ScheduleDay", force: :cascade do |t|
    t.string   "category"
    t.date     "date"
    t.integer  "day"
    t.bigint   "programIndex"
    t.string   "title"

    t.bigint   "Creator"
    t.string   "Slug"
    t.datetime "Created Date"
    t.datetime "Modified Date"

    t.bigint   "fk_ScheduleActivity", array: true, default: []
    t.text     "dayRestore"
  end


  create_table "Schedulepermission", force: :cascade do |t|
    t.bigint   "fk_ScheduleProgram"
    t.bigint   "fk_user"
    t.string   "permission"

    t.bigint   "Creator"
    t.datetime "Created Date"
    t.datetime "Modified Date"
    t.string   "Slug"
  end


  create_table "ScheduleProgram", force: :cascade do |t|
    t.string   "color"
    t.text     "content"
    t.text     "Duration"
    t.bigint   "fk_Scedule_day", array: true, default: []
    t.integer  "index"
    t.integer  "Price"
    t.string   "ScheduleCategory"
    t.text     "subTitle"
    t.text     "t"
    t.text     "title"

    t.bigint   "Creator"
    t.datetime "Created Date"
    t.datetime "Modified Date"
    t.string   "Slug"
    t.text     "fk_Scedule_ProgramRestore"
    t.text     "scheulecategoryRestore"
  end


  create_table "scheduleUserRegist", force: :cascade do |t|
    t.integer  "days"
    t.bigint   "fk_scheduleProgram"
    t.bigint   "fk_userid"
    t.integer  "place"

    t.bigint   "Creator"
    t.datetime "Created Date"
    t.datetime "Modified Date"
    t.string   "Slug"
  end


  #
  # 🔥 Foreign Keys (Bubble 필드 이름 유지)
  #

  # ScheduleActivity → reservationScheduleBook
  add_foreign_key "ScheduleActivity", "reservationScheduleBook", column: "fk_reservationScheduleBook"

  # ScheduleDay → ScheduleActivity (List이므로 단일 FK 연결만 가능)
  # ※ array FK는 DB에서 실제 FK 제약 불가 → ERD용으로 단일 관계만 추가
  add_foreign_key "ScheduleDay", "ScheduleActivity", column: "fk_ScheduleActivity"

  # Schedulepermission → ScheduleProgram
  add_foreign_key "Schedulepermission", "ScheduleProgram", column: "fk_ScheduleProgram"

  # Schedulepermission → User
  add_foreign_key "Schedulepermission", "User", column: "fk_user"

  # ScheduleProgram → ScheduleDay
  add_foreign_key "ScheduleProgram", "ScheduleDay", column: "fk_Scedule_day"

  # scheduleUserRegist → ScheduleProgram
  add_foreign_key "scheduleUserRegist", "ScheduleProgram", column: "fk_scheduleProgram"

  # scheduleUserRegist → User
  add_foreign_key "scheduleUserRegist", "User", column: "fk_userid"

end
