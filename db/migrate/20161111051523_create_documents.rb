class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :filename
      t.references :group

      t.timestamps
    end
  end
end
