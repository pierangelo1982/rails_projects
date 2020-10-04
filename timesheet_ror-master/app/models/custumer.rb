class Custumer < ActiveRecord::Base

	  has_many :timesheets, :dependent => :destroy
	  
end
