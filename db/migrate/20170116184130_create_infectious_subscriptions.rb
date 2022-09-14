# frozen_string_literal: true
class CreateInfectiousSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :infectious_subscriptions do |t|
      t.string :provider
      t.string :verify_token
      t.timestamps null: false
    end
  end
end
