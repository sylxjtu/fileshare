class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :from_user, foreign_key: {to_table: :users}
      t.references :to_user, foreign_key: {to_table: :users}
      t.string :title
      t.text :content
      t.boolean :isread

      t.timestamps
    end
  end
end
