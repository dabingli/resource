class CreateSiteskus < ActiveRecord::Migration
  def change
    create_table :site_skus do |t|
      t.integer :site_id
      t.string :sku

      t.timestamps null: false
    end
  end
end
