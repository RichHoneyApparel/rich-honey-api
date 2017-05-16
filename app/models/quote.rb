class Quote < ActiveRecord::Base
  has_one :size_breakdown
  has_one :label
  has_one :hangtag

  accepts_nested_attributes_for :size_breakdown, :label, :hangtag
end
