class Tyre < ActiveRecord::Base
  belongs_to :car
  belongs_to :owner
  belongs_to :location
  belongs_to :shelf
  belongs_to :block
  belongs_to :floor
  belongs_to :column
  has_many :works, :dependent => :destroy

  validates_presence_of :modello

  
end
