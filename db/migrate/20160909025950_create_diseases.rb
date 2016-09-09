class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
      t.references :user
      t.references :doctor
      t.string :name
      t.text :content

      t.timestamps
    end
    add_index :diseases, :user_id
    add_index :diseases, :doctor_id
  end
end
