class Work < ActiveRecord::Base
  belongs_to :tyre
  has_many :worktypes, dependent: :destroy
  #has_many :worktypologies
  has_many :worktypologies, through: :worktypes
  belongs_to :car

  accepts_nested_attributes_for :worktypes, allow_destroy: true, reject_if: :all_blank
  #serialize :worktypology_ids

end