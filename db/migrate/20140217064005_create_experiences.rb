class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :contact_name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
