class CreateAuthorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.string :access_token
      t.text :data
      t.timestamps null: false
    end
  end
end
