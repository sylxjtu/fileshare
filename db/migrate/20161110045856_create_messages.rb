class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :from_user, foreign_key: true
      t.references :to_user, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :isread

      t.timestamps
    end
  end
end
