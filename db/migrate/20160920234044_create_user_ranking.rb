class CreateUserRanking < ActiveRecord::Migration[5.0]
  def change
    create_table :user_rankings do |t|
      t.references :user, foreign_key: true
      t.references :group_listing, foreign_key: true
      t.integer :location, default: 0
      t.integer :price, default: 0
      t.boolean :liked, default: false
    end
  end
end
