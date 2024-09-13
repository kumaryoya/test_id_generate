class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, id: :string, limit: 10 do |t|
      t.references :post, type: :string, null: false, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
