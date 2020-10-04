class Extralavorowork < ActiveRecord::Base
	belongs_to :extrawork
	belongs_to :catextrawork
	accepts_nested_attributes_for :extrawork



end
