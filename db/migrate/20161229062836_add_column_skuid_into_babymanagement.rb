class AddColumnSkuidIntoBabymanagement < ActiveRecord::Migration
  def change
    add_column :baby_managements, :sku_id, :integer

    reversible do |dir|
      dir.up do
        BabyManagement.all.each do |record|
          sku = Sku.select(:id).find_by(name: record[:sku])
          if sku
            record.update(sku_id: sku.id)
          end
        end
      end
    end

    remove_column :baby_managements, :product_id
    remove_column :baby_managements, :sku
  end
end
