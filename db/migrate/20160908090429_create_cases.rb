class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.text :content
      t.references :user
      t.references :doctor

      t.timestamps
    end
    add_index :cases, :user_id
    add_index :cases, :doctor_id
  end
end
