class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :text
      t.references :challenge, foreign_key: true
      t.belongs_to :avatar

      t.timestamps
    end
  end
end
