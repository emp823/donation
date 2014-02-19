class Experience < ActiveRecord::Base
  has_one :donation, :as => :donatable
  validates_presence_of :latitude, :longitude, :contact_name

  accepts_nested_attributes_for :donation
end
