class StyleRenmaeDatetypeProductfield < ActiveRecord::Migration
  def change
    rename_column :product_fields, :style, :datetype
  end
end
