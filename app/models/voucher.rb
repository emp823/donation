class Voucher < ActiveRecord::Base
  has_one :donation, :as => :donatable
  validates_presence_of :expiration_date

  accepts_nested_attributes_for :donation
end
