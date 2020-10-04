class Shelf < ActiveRecord::Base
	belongs_to :location
	has_many :blocks, :dependent => :destroy

	def selectshelf
    	"#{location.nome} -  Scaffale: #{nome}"
  	end

end
