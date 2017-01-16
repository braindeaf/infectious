class CreateInfectiousSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :infectious_subscriptions do |t|
      t.string :provider
      t.string :verify_token
      t.timestamps null: false
    end
  end
end
