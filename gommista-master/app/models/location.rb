class Location < ActiveRecord::Base
	has_many :shelves, :dependent => :destroy


end
