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

ActiveRecord::Schema.define(:version => 20101230083010) do

  create_table "grades", :force => true do |t|
    t.string   "yslow2_id"
    t.string   "ynumreq"
    t.string   "ycdn"
    t.string   "yexpires"
    t.string   "ycompress"
    t.string   "ycsstop"
    t.string   "yjsbottom"
    t.string   "yexpressions"
    t.string   "yexternal"
    t.string   "ydns"
    t.string   "yminify"
    t.string   "yredirects"
    t.string   "ydupes"
    t.string   "yetags"
    t.string   "yxhr"
    t.string   "yxhrmethod"
    t.string   "ymindom"
    t.string   "yno404"
    t.string   "ymincookie"
    t.string   "ycookiefree"
    t.string   "ynofilter"
    t.string   "yimgnoscale"
    t.string   "yfavicon"
    t.string   "yemptysrc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "page_speeds", :force => true do |t|
    t.integer  "ip"
    t.text     "user_agent"
    t.integer  "url_id"
    t.integer  "w"
    t.float    "o"
    t.integer  "l"
    t.integer  "r"
    t.integer  "t"
    t.text     "v"
    t.float    "pMinifyCSS"
    t.float    "pMinifyJS"
    t.float    "pOptImgs"
    t.float    "pImgDims"
    t.float    "pCombineJS"
    t.float    "pCombineCSS"
    t.float    "pCssInHead"
    t.float    "pBrowserCache"
    t.float    "pProxyCache"
    t.float    "pNoCookie"
    t.float    "pCookieSize"
    t.float    "pParallelDl"
    t.float    "pCssSelect"
    t.float    "pCssJsOrder"
    t.float    "pDeferJS"
    t.float    "pGzip"
    t.float    "pMinRedirect"
    t.float    "pCssExpr"
    t.float    "pUnusedCSS"
    t.float    "pScaleImgs"
    t.float    "pMinDns"
    t.float    "pAvoidBadRequests"
    t.float    "pDupeRsrc"
    t.float    "pOptimizeTheOrderOfStylesAndScripts"
    t.float    "pMinimizeRequestSize"
    t.float    "pSpecifyImageDimensions"
    t.float    "pPutCssInTheDocumentHead"
    t.float    "pMinifyHTML"
    t.float    "pServeScaledImages"
    t.float    "pSpecifyCharsetEarly"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "urls", :force => true do |t|
    t.binary   "name"
    t.string   "country"
    t.integer  "country_rank"
    t.integer  "global_rank"
    t.integer  "country_reach_permillion"
    t.integer  "country_page_views_permillion"
    t.integer  "country_page_views_peruser"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "api_key"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "yslow2s", :force => true do |t|
    t.integer  "url_id"
    t.integer  "ip"
    t.text     "user_agent"
    t.integer  "w"
    t.integer  "o"
    t.integer  "r"
    t.integer  "s"
    t.integer  "i"
    t.integer  "lt"
    t.integer  "g"
    t.integer  "w_c"
    t.integer  "r_c"
    t.text     "stats"
    t.text     "stats_c"
    t.text     "comps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
