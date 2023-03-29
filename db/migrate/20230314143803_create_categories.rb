class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :user_id
      

      t.timestamps
    end
  end
end
