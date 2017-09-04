class CreateFixedrunnings < ActiveRecord::Migration
  def change
    create_table :fixedrunnings do |t|
      t.integer :user_id
      t.date :date
      t.string :description

      t.timestamps null: false
    end
  end
end
