class AddColumnCeramicsThicknessIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :ceramics_thickness, :string
  end
  def down
    remove_column :ceramics_thickness
  end
end
