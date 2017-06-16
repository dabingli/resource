class AddColumnInternalRangeExternalRangeIntoProduct < ActiveRecord::Migration
  def change
  	add_column :products, :internal_range, :string
  	add_column :products, :external_range, :string
  end
end
