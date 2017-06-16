class AddUrlToImages < ActiveRecord::Migration
  def change
    add_column :images, :url, :string

    reversible do |dir|
      dir.up do
        url_prefix = "#{ImageUploader.qiniu_protocol}://#{ImageUploader.qiniu_bucket_domain}/resource/"
        execute "UPDATE images SET url = CONCAT('#{url_prefix}', image);"
      end
    end
  end
end
