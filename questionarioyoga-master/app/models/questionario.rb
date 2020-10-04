class Questionario < ActiveRecord::Base
	has_many :questionariodata
	accepts_nested_attributes_for :questionariodata, :reject_if => :all_blank, :allow_destroy => true
end
