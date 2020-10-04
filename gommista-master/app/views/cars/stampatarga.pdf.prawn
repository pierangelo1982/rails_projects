pdf = Prawn::Document.new(:page_size => [175, 283], :margin => [5,5,5,5], :page_layout => :portrait)
pdf.text "#{@car.targa}", :align => :center, :size => 24, :inline_format => true
barcode = "app/assets/images/barcodes/#{@car.targa}.png"
pdf.move_down(0)
pdf.image barcode, :scale => 0.8, :position => :center
pdf.text "CENTRO AUTO DELBARBA", :align => :center, :size => 10
pdf.text "#{@car.owner.denominazione}", :align => :center, :size => 10

