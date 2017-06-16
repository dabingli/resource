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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170607083949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_functions", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ancillary_incidentals", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "appearances", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "applicable_spaces", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baby_managements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "baby_no"
    t.integer  "sku_id"
  end

  add_index "baby_managements", ["updated_at"], name: "index_baby_managements_on_updated_at", using: :btree

  create_table "base_types", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "base_units", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  add_index "base_units", ["updated_at"], name: "index_base_units_on_updated_at", using: :btree

  create_table "buckle_types", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_units", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  add_index "business_units", ["updated_at"], name: "index_business_units_on_updated_at", using: :btree

  create_table "capacities", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chamfering_processes", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chassis_materials", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "color_temperatures", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  add_index "colors", ["updated_at"], name: "index_colors_on_updated_at", using: :btree

  create_table "currencies", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
    t.string   "en_name"
  end

  add_index "currencies", ["updated_at"], name: "index_currencies_on_updated_at", using: :btree

  create_table "domestic_prices", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "nomember_price"
    t.decimal  "member_price"
    t.integer  "warehouse_id"
    t.integer  "sku_id"
    t.integer  "site_id"
  end

  add_index "domestic_prices", ["updated_at"], name: "index_domestic_prices_on_updated_at", using: :btree

  create_table "door_opening_methods", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "drainage_methods", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "eco_levels", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "export_prices", force: :cascade do |t|
    t.integer  "sku_id"
    t.integer  "price_unit_id"
    t.decimal  "price"
    t.decimal  "nomember_price"
    t.decimal  "member_price"
    t.boolean  "active"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "face_prices", force: :cascade do |t|
    t.integer  "sku_id"
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "store_price"
  end

  create_table "features", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flush_control_methods", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "flush_methods", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "flush_volumes", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "glass_thicknesses", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "glass_varieties", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "guides", force: :cascade do |t|
    t.integer  "product_category_id"
    t.text     "solution"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "md5"
    t.integer  "file_size"
    t.string   "filename"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  add_index "images", ["updated_at"], name: "index_images_on_updated_at", using: :btree

  create_table "installation_methods", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "lamp_technologies", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lampshade_attachments", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lampshade_materials", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "foreign"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lids", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "light_attachments", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "light_categories", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "light_materials", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "light_quantities", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lumen", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "main_cabinet_ranges", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  add_index "materials", ["updated_at"], name: "index_materials_on_updated_at", using: :btree

  create_table "mesa_styles", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "mirror_cabinet_ranges", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outlet_directions", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "package_methods", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pits_distances", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "powers", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_units", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  add_index "price_units", ["updated_at"], name: "index_price_units_on_updated_at", using: :btree

  create_table "problems", force: :cascade do |t|
    t.integer  "product_category_id"
    t.text     "solution"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  add_index "product_categories", ["updated_at"], name: "index_product_categories_on_updated_at", using: :btree

  create_table "product_category_base_units", force: :cascade do |t|
    t.integer  "product_category_id"
    t.integer  "position"
    t.integer  "base_unit_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "product_category_base_units", ["updated_at"], name: "index_product_category_base_units_on_updated_at", using: :btree

  create_table "product_category_materials", force: :cascade do |t|
    t.integer  "material_id"
    t.integer  "product_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "position"
  end

  add_index "product_category_materials", ["updated_at"], name: "index_product_category_materials_on_updated_at", using: :btree

  create_table "product_category_product_styles", force: :cascade do |t|
    t.integer  "product_category_id"
    t.integer  "position"
    t.integer  "product_style_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "product_category_product_types", force: :cascade do |t|
    t.integer  "product_type_id"
    t.integer  "product_category_id"
    t.integer  "position"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "product_category_shapes", force: :cascade do |t|
    t.integer  "product_category_id"
    t.integer  "position"
    t.integer  "shape_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "product_category_shapes", ["updated_at"], name: "index_product_category_shapes_on_updated_at", using: :btree

  create_table "product_category_spec_sizes", force: :cascade do |t|
    t.integer  "product_category_id"
    t.integer  "position"
    t.integer  "spec_size_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "product_category_surface_crafts", force: :cascade do |t|
    t.integer  "product_category_id"
    t.integer  "position"
    t.integer  "surface_craft_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "product_category_surface_crafts", ["updated_at"], name: "index_product_category_surface_crafts_on_updated_at", using: :btree

  create_table "product_fabrics", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_fields", force: :cascade do |t|
    t.integer  "product_category_id"
    t.integer  "position"
    t.string   "name"
    t.string   "title"
    t.boolean  "required",            default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "product_fields", ["product_category_id", "position"], name: "index_product_fields_on_product_category_id_and_position", using: :btree

  create_table "product_hall_skus", force: :cascade do |t|
    t.integer  "product_hall_id"
    t.integer  "sku_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "product_halls", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_image_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "max_count"
  end

  add_index "product_image_categories", ["updated_at"], name: "index_product_image_categories_on_updated_at", using: :btree

  create_table "product_images", force: :cascade do |t|
    t.integer  "position"
    t.integer  "image_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "product_image_category_id"
    t.integer  "sku_id"
  end

  add_index "product_images", ["updated_at"], name: "index_product_images_on_updated_at", using: :btree

  create_table "product_languages", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name"
    t.string   "description"
    t.string   "brand"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "product_structures", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_styles", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "product_types", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_use_places", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "product_category_id"
    t.string   "product_no"
    t.string   "name"
    t.text     "description"
    t.string   "spec"
    t.string   "brand"
    t.integer  "water_absrp_rate_id"
    t.integer  "shape_id"
    t.integer  "color_id"
    t.integer  "cases_per_pallet"
    t.decimal  "unit_weight"
    t.decimal  "unit_area"
    t.decimal  "package_weight"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "surface_craft_id"
    t.integer  "base_unit_id"
    t.integer  "business_unit_id"
    t.integer  "material_id"
    t.string   "packing_unit"
    t.integer  "rim_category_id"
    t.integer  "root_product_category_id"
    t.integer  "product_use_place_id"
    t.integer  "product_style_id"
    t.string   "package_dimension"
    t.integer  "spec_size_id"
    t.boolean  "has_wooden_rack"
    t.integer  "flush_method_id"
    t.integer  "drainage_method_id"
    t.integer  "flush_volume_id"
    t.boolean  "has_cover_damper"
    t.integer  "pits_distance_id"
    t.boolean  "has_water_bend"
    t.integer  "installation_method_id"
    t.integer  "tap_hole_id"
    t.integer  "mesa_style_id"
    t.integer  "main_cabinet_range_id"
    t.integer  "mirror_cabinet_range_id"
    t.integer  "side_cabinet_range_id"
    t.boolean  "has_mirror_lamp"
    t.integer  "door_opening_method_id"
    t.boolean  "has_contain_chassis"
    t.boolean  "has_steam"
    t.integer  "flush_control_method_id"
    t.integer  "chassis_material_id"
    t.integer  "glass_varieties_id"
    t.integer  "shower_faucet_style_id"
    t.integer  "whole_material_id"
    t.integer  "shower_type_bracket_id"
    t.integer  "spool_style_id"
    t.boolean  "has_cold_hot_water"
    t.integer  "slot_number_id"
    t.integer  "ancillary_incidental_id"
    t.string   "series"
    t.integer  "appearance_id"
    t.string   "drain_water_way"
    t.integer  "lid_id"
    t.integer  "towel_rack_style_id"
    t.integer  "outlet_direction_id"
    t.integer  "package_method_id"
    t.string   "main_cabinet_size"
    t.string   "mirror_cabinet_size"
    t.string   "side_cabinet_size"
    t.integer  "glass_thickness_id"
    t.integer  "water_temperature_id"
    t.integer  "take_temperature_id"
    t.integer  "power_id"
    t.integer  "additional_function_id"
    t.integer  "safety_device_id"
    t.integer  "capacity_id"
    t.integer  "seat_power_id"
    t.integer  "thickness_id"
    t.string   "ceramics_thickness"
    t.string   "product_origin"
    t.string   "set_number"
    t.string   "number_of_package_items"
    t.integer  "product_structure_id"
    t.string   "facing_materials"
    t.integer  "product_fabric_id"
    t.string   "painting_process"
    t.integer  "surface_gloss_id"
    t.integer  "spring_structure_id"
    t.string   "filler"
    t.integer  "seat_comfort_id"
    t.string   "package_items"
    t.string   "production_cycle"
    t.boolean  "customizable"
    t.string   "maintenance_instruction"
    t.string   "warranty_time"
    t.string   "design_concept"
    t.string   "meterial_advantage"
    t.string   "functionality_advantage"
    t.string   "product_material"
    t.boolean  "has_heating"
    t.integer  "product_type_id"
    t.integer  "voltage_level_id"
    t.boolean  "intelligence"
    t.integer  "applicable_space_id"
    t.integer  "light_material_id"
    t.integer  "light_attachment_id"
    t.integer  "lampshade_material_id"
    t.integer  "lampshade_attachment_id"
    t.integer  "lamp_technology_id"
    t.boolean  "light_source"
    t.integer  "source_category_id"
    t.integer  "spatial_range_id"
    t.integer  "suitable_storey_id"
    t.integer  "light_category_id"
    t.integer  "color_temperature_id"
    t.integer  "lumen_id"
    t.integer  "feature_id"
    t.integer  "base_type_id"
    t.integer  "light_quantity_id"
    t.string   "certificate"
    t.string   "internal_range"
    t.string   "external_range"
    t.string   "wood_species"
    t.string   "surface_effect"
    t.string   "mat_handle"
    t.integer  "eco_level_id"
    t.integer  "buckle_type_id"
    t.integer  "chamfering_process_id"
    t.integer  "wax_process_id"
    t.string   "product_color"
    t.string   "power_capacity"
    t.string   "light_body"
    t.string   "product_shape"
    t.string   "lanterns_technology"
    t.string   "light_number"
    t.string   "functional_property"
    t.string   "product_mold"
    t.string   "colour_temperature"
    t.string   "light_tone"
    t.string   "current"
    t.string   "gloss"
  end

  add_index "products", ["updated_at"], name: "index_products_on_updated_at", using: :btree

  create_table "rim_categories", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  add_index "rim_categories", ["updated_at"], name: "index_rim_categories_on_updated_at", using: :btree

  create_table "safety_devices", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seat_comforts", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seat_powers", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "series_images", force: :cascade do |t|
    t.integer  "product_category_id"
    t.integer  "image_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "series_images", ["product_category_id"], name: "index_series_images_on_product_category_id", using: :btree

  create_table "shapes", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  add_index "shapes", ["updated_at"], name: "index_shapes_on_updated_at", using: :btree

  create_table "shower_faucet_styles", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "shower_type_brackets", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "side_cabinet_ranges", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_skus", force: :cascade do |t|
    t.integer  "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sku_id"
  end

  add_index "site_skus", ["updated_at"], name: "index_site_skus_on_updated_at", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "domestic"
  end

  add_index "sites", ["updated_at"], name: "index_sites_on_updated_at", using: :btree

  create_table "skus", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "skus", ["updated_at"], name: "index_skus_on_updated_at", using: :btree

  create_table "slot_numbers", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "source_categories", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spatial_ranges", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spec_sizes", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "spool_styles", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "spring_structures", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suitable_storeys", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surface_crafts", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  add_index "surface_crafts", ["updated_at"], name: "index_surface_crafts_on_updated_at", using: :btree

  create_table "surface_glosses", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "take_temperatures", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tap_holes", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "thicknesses", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "towel_rack_styles", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "employee_number"
    t.string   "name"
    t.string   "mobile"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

  add_index "users", ["updated_at"], name: "index_users_on_updated_at", using: :btree

  create_table "voltage_levels", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  add_index "warehouses", ["updated_at"], name: "index_warehouses_on_updated_at", using: :btree

  create_table "water_absrp_rates", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

  add_index "water_absrp_rates", ["updated_at"], name: "index_water_absrp_rates_on_updated_at", using: :btree

  create_table "water_temperatures", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wax_processes", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "whole_materials", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "en_name"
  end

end
