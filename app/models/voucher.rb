class Voucher < ActiveRecord::Base
  has_one :donation, :as => :donatable
  validates_presence_of :expiration_date
  validate :expiration_date_cannot_be_in_the_past

  accepts_nested_attributes_for :donation

  def expiration_date_cannot_be_in_the_past
    errors.add(:expiration_date, "cannot be in the past") if !expiration_date.blank? and expiration_date < Date.today
  end
end
