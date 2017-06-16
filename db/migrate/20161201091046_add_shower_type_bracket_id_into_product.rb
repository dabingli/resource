class AddShowerTypeBracketIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :shower_type_bracket_id, :integer
  end

  def down
    remove_column :products, :shower_type_bracket_id
  end
end
