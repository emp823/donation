class Voucher < ActiveRecord::Base
  has_one :donation, :as => :donatable
end
