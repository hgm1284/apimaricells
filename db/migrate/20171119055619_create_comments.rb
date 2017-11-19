class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.boolean :status
      t.belongs_to :user, index: true
      t.belongs_to :bill, index: true
      t.timestamps
    end
  end
end