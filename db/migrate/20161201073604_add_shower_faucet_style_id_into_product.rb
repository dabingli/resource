class AddShowerFaucetStyleIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :shower_faucet_style_id, :integer
  end

  def down
    remove_column :products, :shower_faucet_style_id, :integer
  end
end
