class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :donatable, polymorphic: true

  validates_presence_of :title, :description, :user_id, :donatable_id, :donatable_type
end
