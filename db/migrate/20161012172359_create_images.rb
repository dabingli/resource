class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :md5
      t.integer :file_size
      t.string :filename
      t.string :image

      t.timestamps null: false
    end
  end
end
