class JavascriptsController < ApplicationController

  def dynamic_blocks
  	@shelves = Shelf.find(:all)
    @blocks = Block.find(:all)
    @floors = Floor.find(:all)
    @columns = Column.find(:all)
  end

  def dynamic_works
  	@tyres = Tyre.find(:all)
  end
  
end
