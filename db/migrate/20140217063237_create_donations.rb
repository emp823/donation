class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :title
      t.string :description
      t.belongs_to :user
      t.references :donatable, polymorphic: true
      t.timestamps
    end
  end
end
