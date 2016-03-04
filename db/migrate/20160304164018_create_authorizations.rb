class CreateAuthorizations < ActiveRecord::Migration[5.0]
  def up
    create_table :infectious_authorizations do |t|
      t.string :provider
      t.string :access_token
      t.text :data
      t.timestamps null: false
    end
  end
  def down
    drop_table :authorizations
  end
end
