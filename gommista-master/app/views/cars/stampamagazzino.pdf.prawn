pdf = Prawn::Document.new(:page_size => [175, 283], :margin => [5,5,5,5], :page_layout => :portrait)
pdf.text "#{@car.owner.denominazione}", :align => :center, :size => 16, :inline_format => true
pdf.move_down(10)
pdf.text "#{@car.targa}", :align => :center, :size => 16, :inline_format => true
pdf.move_down(10)
@car.tyres.each do |tyre|
	pdf.text "#{tyre.modello}", :align => :center, :size => 18, :inline_format => true
end
@car.tyres.each do |tyre|
pdf.text "Scaffale: #{tyre.shelf.try(:nome)}", :align => :center, :size => 15
pdf.text "Blocco: #{tyre.block.try(:nome)} - Piano:#{tyre.floor.try(:nome)}", :align => :center, :size => 15
end

pdf.move_down(0)

