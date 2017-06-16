class AddEnglishNameToColors < ActiveRecord::Migration
  def change
    add_column :colors, :english_name, :string
  end
end
