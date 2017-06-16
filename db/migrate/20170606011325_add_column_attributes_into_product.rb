class AddColumnAttributesIntoProduct < ActiveRecord::Migration
  def change
  	add_column :products, :product_color,      :string
  	add_column :products, :power_capacity,     :string
  	add_column :products, :light_body,         :string
  	add_column :products, :product_shape,      :string
  	add_column :products, :lanterns_technology,:string
  	add_column :products, :light_number,       :string
  	add_column :products, :functional_property,:string
  	add_column :products, :product_mold,       :string
  	add_column :products, :colour_temperature, :string
  	add_column :products, :light_tone,         :string
  	add_column :products, :current,            :string
  end
end
