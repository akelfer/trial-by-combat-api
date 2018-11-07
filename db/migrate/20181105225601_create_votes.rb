class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :direction, null: false
      t.references :content, polymorphic: true, index: true
      t.belongs_to :avatar
      t.timestamps
    end
  end
end
