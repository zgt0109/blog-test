class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :user
      t.string :name
      t.text :content

      t.timestamps
    end
    add_index :topics, :user_id
  end
end
