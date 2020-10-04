class Pezzo < ActiveRecord::Base
  belongs_to :azienda
  has_many :lavoraziones
  accepts_nested_attributes_for :lavoraziones, :reject_if => :all_blank, :allow_destroy => true
end
