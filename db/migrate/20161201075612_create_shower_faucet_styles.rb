class CreateShowerFaucetStyles < ActiveRecord::Migration
  def change
    create_table :shower_faucet_styles do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
