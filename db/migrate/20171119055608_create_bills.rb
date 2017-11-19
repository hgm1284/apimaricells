class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
    	      t.string :brand
      t.string :model
      t.string :serie
      t.string :color
      t.integer :money
      t.text :accesories
      t.string :status
      t.string :report
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
