class CreateSearchingGroup < ActiveRecord::Migration[5.0]
  def change
    create_table :searching_groups do |t|
      t.text :name
      t.text :description
      t.text :location
      t.integer :max_number_of_people
      t.decimal :max_budget_per_month
      
      t.timestamps
    end
  end
end
