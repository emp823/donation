class Item < ActiveRecord::Base
  has_one :donation, :as => :donatable, dependent: :destroy
  validates_presence_of :height, :width, :weight
  validates_numericality_of :height, :width, :weight, greater_than: 0

  accepts_nested_attributes_for :donation
end
