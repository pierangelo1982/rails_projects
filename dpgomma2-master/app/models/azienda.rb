class Azienda < ActiveRecord::Base
	has_many :pezzos, :dependent => :destroy
	has_many :entrata, :dependent => :destroy
	has_many :banks, :dependent => :destroy
	has_many :lavoraziones, :through => :pezzos

	accepts_nested_attributes_for :banks, :reject_if => :all_blank, :allow_destroy => true


end
