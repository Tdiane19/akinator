class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.text :answers, array: true, default: []

      t.timestamps
    end
  end
end
