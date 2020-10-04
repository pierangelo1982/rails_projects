class Custumer < ActiveRecord::Base

	has_many :custumer_banks
	accepts_nested_attributes_for :custumer_banks, :reject_if => :all_blank, :allow_destroy => true

	has_one :address, dependent: :destroy
	accepts_nested_attributes_for :address, :reject_if => :all_blank, :allow_destroy => true


end
