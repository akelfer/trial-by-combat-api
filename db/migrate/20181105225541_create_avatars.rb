class CreateAvatars < ActiveRecord::Migration[5.2]
  def change
    create_table :avatars do |t|
      t.string :name, null: false
      t.integer :reputation, null: false, :default => 10
      t.boolean :active, :default => true
      t.belongs_to :user
      t.timestamps
    end
  end
end
