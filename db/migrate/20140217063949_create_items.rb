class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :height
      t.integer :width
      t.integer :weight

      t.timestamps
    end
  end
end
