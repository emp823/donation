class Item < ActiveRecord::Base
  has_one :donation, :as => :donatable
  validates_presence_of :height, :width, :weight
end
