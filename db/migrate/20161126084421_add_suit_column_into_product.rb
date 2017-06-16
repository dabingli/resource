class AddSuitColumnIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :spec_size_id,       :integer
    add_column :products, :has_wooden_rack,    :boolean
    add_column :products, :outlet_direction,   :string
    add_column :products, :flush_method_id,    :integer
    add_column :products, :drainage_method_id, :integer
    add_column :products, :flush_volume_id,    :integer
    add_column :products, :has_cover_damper,   :boolean
    add_column :products, :pits_distance_id,   :boolean
  end

  def down
    remove_column :products, :spec_size_id,       :integer
    remove_column :products, :has_wooden_rack,    :boolean
    remove_column :products, :outlet_direction,   :string
    remove_column :products, :flush_method_id,    :integer
    remove_column :products, :drainage_method_id, :integer
    remove_column :products, :flush_volume_id,    :integer
    remove_column :products, :has_cover_damper,   :boolean
    remove_column :products, :pits_distance_id,   :boolean
  end
end
