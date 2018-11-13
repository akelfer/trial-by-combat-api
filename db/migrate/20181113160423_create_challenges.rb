class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :title
      t.belongs_to :avatar
      t.integer :target_id

      t.timestamps
    end
  end
end
