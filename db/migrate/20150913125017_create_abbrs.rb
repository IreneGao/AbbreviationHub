class CreateAbbrs < ActiveRecord::Migration
  def change
    create_table :abbrs do |t|
      t.string :abbreviation
      t.string :full_name

      t.timestamps null: false
    end
  end
end
