class Item < ActiveRecord::Base
  has_one :donation, :as => :donatable, dependent: :destroy
  validates_presence_of :height, :width, :weight

  accepts_nested_attributes_for :donation
end
