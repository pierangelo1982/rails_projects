class Owner < ActiveRecord::Base
	has_many :cars, :dependent => :destroy
	has_many :tyres, through: :cars

	validates_presence_of :denominazione
	validates_uniqueness_of :denominazione
end
