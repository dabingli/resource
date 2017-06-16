class AddEnglishNameFields < ActiveRecord::Migration
  def change
    add_column :currencies, :code, :string, unique: true
    # add_index :currencies, :code, unique: true
    remove_column :colors, :english_name, :string

    tables = [
      :ancillary_incidentals, :appearances, :base_units, :business_units,
      :chassis_materials, :colors, :currencies, :door_opening_methods, :drainage_methods,
      :flush_control_methods, :flush_methods, :flush_volumes, :glass_varieties,
      :installation_methods, :lids, :materials, :mesa_styles,
      :outlet_directions, :pits_distances, :price_units, :product_categories, :product_styles,
      :product_use_places, :rim_categories, :shapes, :shower_faucet_styles,
      :shower_type_brackets, :slot_numbers, :spec_sizes, :spool_styles,
      :surface_crafts, :tap_holes, :towel_rack_styles,
      :warehouses, :water_absrp_rates, :whole_materials,
    ]

    tables.each do |table_name|
      add_column table_name, :en_name, :string
    end
  end
end
