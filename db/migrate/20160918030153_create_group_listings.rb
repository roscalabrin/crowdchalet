class CreateGroupListings < ActiveRecord::Migration[5.0]
  def change
    create_table :group_listings do |t|
      t.references :user_listing, foreign_key: true
      t.references :searching_group, foreign_key: true
    end
  end
end
