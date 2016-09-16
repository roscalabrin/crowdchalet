class CreateUserListings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_listings do |t|
      t.text :name
      t.text :url
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
