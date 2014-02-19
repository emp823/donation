class Experience < ActiveRecord::Base
  has_one :donation, :as => :donatable
  validates_presence_of :latitude, :longitude, :contact_name
  validates :latitude , numericality: { greater_than:  -90, less_than:  90 }
  validates :longitude, numericality: { greater_than: -180, less_than: 180 }

  accepts_nested_attributes_for :donation
end
