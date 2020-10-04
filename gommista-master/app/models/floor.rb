class Floor < ActiveRecord::Base
  belongs_to :block
  has_many :columns, :dependent => :destroy

    def selectshelf
    	"#{block.shelf.location.nome} - Scaffale #{block.shelf.nome} - Blocco: #{block.nome} - Piano: #{nome}"
  	end

end
