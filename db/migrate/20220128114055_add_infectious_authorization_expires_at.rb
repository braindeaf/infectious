class AddInfectiousAuthorizationExpiresAt < ActiveRecord::Migration[5.2]
  def change
    add_column :infectious_authorizations, :expires_at, :timestamp, default: nil, after: :data
  end
end
