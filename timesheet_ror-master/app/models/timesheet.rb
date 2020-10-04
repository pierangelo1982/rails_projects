class Timesheet < ActiveRecord::Base
  belongs_to :worker
  belongs_to :custumer

    before_update :ore

 
 	def ore
 		if self.fine != nil
 			self.ore = (self.fine - self.inizio).to_d / 3600
 		else
 			self.ore = 0
 		end
 	end


end
