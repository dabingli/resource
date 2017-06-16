class AddColumnGlossIntoProducts < ActiveRecord::Migration
  def change
  	add_column :products, :gloss, :string
  end
end
