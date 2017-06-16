class AddCabinetSizeIdIntoProduct < ActiveRecord::Migration
   def up
     add_column :products, :cabinet_size_id, :integer
   end

   def down
     remove_column :products, :cabinet_size_id, :integer
   end
end
