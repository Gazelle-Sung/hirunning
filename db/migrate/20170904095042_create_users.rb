class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :major
      t.string :grade
      t.integer :participation

      t.timestamps null: false
    end
  end
end
