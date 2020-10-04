class Worktype < ActiveRecord::Base

	belongs_to :work
	belongs_to :worktypology
	accepts_nested_attributes_for :work, :worktypology

end
