class Block < ActiveRecord::Base
  belongs_to :shelf
  has_many :floors, :dependent => :destroy

  	def selectshelf
    	"#{shelf.location.nome} - Scaffale #{shelf.nome} - Blocco: #{nome}"
  	end

end
