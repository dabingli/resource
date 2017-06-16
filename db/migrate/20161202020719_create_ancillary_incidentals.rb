class CreateAncillaryIncidentals < ActiveRecord::Migration
  def change
    create_table :ancillary_incidentals do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
