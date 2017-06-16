class AddColumnCertificateIntoProduct < ActiveRecord::Migration
  def change
  	add_column :products, :certificate, :string
  end
end
