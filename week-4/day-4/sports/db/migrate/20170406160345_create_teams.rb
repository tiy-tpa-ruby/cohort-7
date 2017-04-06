class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :mascot
      t.string :sport
      t.string :city
      t.integer :year_founded

      t.timestamps
    end
  end
end
