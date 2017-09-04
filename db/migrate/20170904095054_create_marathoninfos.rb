class CreateMarathoninfos < ActiveRecord::Migration
  def change
    create_table :marathoninfos do |t|
      t.string :name
      t.date :date
      t.string :price
      t.string :site
      t.string :area

      t.timestamps null: false
    end
  end
end
