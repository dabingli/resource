class AddModifySiteIdIntoBabyManagement < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do 
        #Sku.all.each do |sku|
          #sku.baby_site_ids = sku.site_ids
        #end
      end
    end
  end
end
