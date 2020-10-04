pdf = Prawn::Document.new(:page_size => [175, 283], :margin => [5,5,5,5], :page_layout => :landscape)

pdf.text "#{@car.owner.denominazione}", :align => :center, :size => 20
pdf.move_down(15)

@car.tyres.each do |tyre|
	pdf.text "#{tyre.modello}", :align => :center, :size => 24, :inline_format => true
end
pdf.move_down(10)

pdf.text "Targa: #{@car.targa}", :align => :left, :size => 18, :width => 130 
pdf.move_down(-22)
pdf.text "#{@car.marca}, #{@car.modello}", :align => :right, :size => 18

pdf.move_down(5)
@car.tyres.each do |tyre|
	if tyre.kit == true
		pdf.text "KIT: SI", :align => :left, :size => 18, :width => 130
	else
		pdf.text "KIT: NO", :align => :left, :size => 18, :width => 130
	end
end

pdf.move_down(-23)
pdf.text "ASX", :align => :right, :size => 24
pdf.move_down(5)
@car.tyres.each do |tyre|
pdf.text "Scaffale: #{tyre.shelf.try(:nome)} Blocco: #{tyre.block.try(:nome)} Piano:#{tyre.floor.try(:nome)}", :align => :left, :size => 18
end







pdf.start_new_page(:size => [175, 283], :layout => :landscape)

pdf.text "#{@car.owner.denominazione}", :align => :center, :size => 20
pdf.move_down(15)

@car.tyres.each do |tyre|
	pdf.text "#{tyre.modello}", :align => :center, :size => 24, :inline_format => true
end
pdf.move_down(10)

pdf.text "Targa: #{@car.targa}", :align => :left, :size => 18, :width => 130 
pdf.move_down(-22)
pdf.text "#{@car.marca}, #{@car.modello}", :align => :right, :size => 18

pdf.move_down(5)
@car.tyres.each do |tyre|
	if tyre.kit == true
		pdf.text "KIT: SI", :align => :left, :size => 18, :width => 130
	else
		pdf.text "KIT: NO", :align => :left, :size => 18, :width => 130
	end
end

pdf.move_down(-23)
pdf.text "ADX", :align => :right, :size => 24
pdf.move_down(5)
@car.tyres.each do |tyre|
pdf.text "Scaffale: #{tyre.shelf.try(:nome)} Blocco: #{tyre.block.try(:nome)} Piano:#{tyre.floor.try(:nome)}", :align => :left, :size => 18
end



pdf.start_new_page(:size => [175, 283], :layout => :landscape)

pdf.text "#{@car.owner.denominazione}", :align => :center, :size => 20
pdf.move_down(15)

@car.tyres.each do |tyre|
	pdf.text "#{tyre.modello}", :align => :center, :size => 24, :inline_format => true
end
pdf.move_down(10)

pdf.text "Targa: #{@car.targa}", :align => :left, :size => 18, :width => 130 
pdf.move_down(-22)
pdf.text "#{@car.marca}, #{@car.modello}", :align => :right, :size => 18

pdf.move_down(5)
@car.tyres.each do |tyre|
	if tyre.kit == true
		pdf.text "KIT: SI", :align => :left, :size => 18, :width => 130
	else
		pdf.text "KIT: NO", :align => :left, :size => 18, :width => 130
	end
end

pdf.move_down(-23)
pdf.text "PSX", :align => :right, :size => 24
pdf.move_down(5)
@car.tyres.each do |tyre|
pdf.text "Scaffale: #{tyre.shelf.try(:nome)} Blocco: #{tyre.block.try(:nome)} Piano:#{tyre.floor.try(:nome)}", :align => :left, :size => 18
end



pdf.start_new_page(:size => [175, 283], :layout => :landscape)

pdf.text "#{@car.owner.denominazione}", :align => :center, :size => 20
pdf.move_down(15)

@car.tyres.each do |tyre|
	pdf.text "#{tyre.modello}", :align => :center, :size => 24, :inline_format => true
end
pdf.move_down(10)

pdf.text "Targa: #{@car.targa}", :align => :left, :size => 18, :width => 130 
pdf.move_down(-22)
pdf.text "#{@car.marca}, #{@car.modello}", :align => :right, :size => 18

pdf.move_down(5)
@car.tyres.each do |tyre|
	if tyre.kit == true
		pdf.text "KIT: SI", :align => :left, :size => 18, :width => 130
	else
		pdf.text "KIT: NO", :align => :left, :size => 18, :width => 130
	end
end

pdf.move_down(-23)
pdf.text "PDX", :align => :right, :size => 24
pdf.move_down(5)
@car.tyres.each do |tyre|
pdf.text "Scaffale: #{tyre.shelf.try(:nome)} Blocco: #{tyre.block.try(:nome)} Piano:#{tyre.floor.try(:nome)}", :align => :left, :size => 18
end





