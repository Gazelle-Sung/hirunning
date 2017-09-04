class CreateFixedrunninginfos < ActiveRecord::Migration
  def change
    create_table :fixedrunninginfos do |t|
      t.date :date
      t.string :startlocation
      t.time :time
      t.string :meetlocation
      t.string :content

      t.timestamps null: false
    end
  end
end
