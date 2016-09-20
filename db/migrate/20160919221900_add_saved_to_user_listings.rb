class AddSavedToUserListings < ActiveRecord::Migration[5.0]
  def change
    add_column :user_listings, :saved, :boolean, :default => true
  end
end
