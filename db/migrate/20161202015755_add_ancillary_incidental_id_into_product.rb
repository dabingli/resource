class AddAncillaryIncidentalIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :ancillary_incidental_id, :integer
  end

  def down
    remove_column :products, :ancillary_incidental_id
  end
end
