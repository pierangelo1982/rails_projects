class Interno < ActiveRecord::Base
  belongs_to :azienda
  belongs_to :operatore
  has_many :lavoraziones
  has_many :internodata
  accepts_nested_attributes_for :internodata, :reject_if => :all_blank, :allow_destroy => true


end
