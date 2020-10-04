class Worktypology < ActiveRecord::Base
	has_many :worktypes
	has_many :works, through: :worktypes
	accepts_nested_attributes_for :worktypes, allow_destroy: true
    
end
