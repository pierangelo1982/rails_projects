
pdf.text "MOTOWORK snc", :align => :left, :size => 16
pdf.text "di Carrà Andrea & C.", :align => :left, :size => 16
pdf.text "P.IVA: 03716390160 - Cod.Fisc: 03716390160", :align => :left, :size => 10
pdf.text "Via Campo Rampino 2896 - 24050 - Covo (BG)", :align => :left, :size => 10
pdf.text "Tel & Fax 0363 - 910471 - 347-4761860 (Andrea)", :align => :left, :size => 10
pdf.text "email: info@motowork.it - web: www.motowork.it", :align => :left, :size => 10


pdf.move_down(30)


pdf.text "Spett.le: #{@invoice.address_book.name}", :align => :right, :size => 12, :style => :bold
pdf.text "P.iva: #{@invoice.address_book.vat}", :align => :right, :size => 10
pdf.text "CodFisc: #{@invoice.address_book.tax_code}", :align => :right, :size => 10
pdf.text "Via: #{@invoice.address_book.address}, #{@invoice.address_book.address_nr}", :align => :right, :size => 10
pdf.text "#{@invoice.address_book.zip}, #{@invoice.address_book.city}", :align => :right, :size => 10



pdf.move_down(40)


pdf.text "Fattura Numero: #{@invoice.invoice_number}, Del: #{@invoice.invoice_date.strftime "%d-%m-%Y"}", :align => :left, :size => 10


pdf.move_down(10)



widths = [60,190,50,90,90,60]
#cell_height = 17

pdf.table([["Cod", "Descrizione",  "Quantità", "Prezzo Unitario", "Importo", "Iva"]], :column_widths => widths, :row_colors => ["F0F0F0", "FFFFCC"], :cell_style => { size: 9 } )

@invoice.invoice_items.each do |ia|
pdf.table([[
      pdf.make_cell(:content => ia.try(:code), :font => "Courier", :size => 9),
      pdf.make_cell(:content => "#{ia.name} \n #{ia.description}", :font => "Courier", :size => 9),
      pdf.make_cell(:content => ia.quantity.to_s,  :font => "Courier", :size => 9, :align => :right),
      pdf.make_cell(:content => "#{number_to_currency(ia.unit_price, :unit=>'€.', precision: 3, :delimiter=>'.', :separator=>',')}", :font => "Courier", :size => 9, :align => :right),
      pdf.make_cell(:content => "#{number_to_currency(ia.total_price, :unit=>'€.', precision: 3, :delimiter=>'.', :separator=>',')}", :font => "Courier", :size => 10, :align=>:right),
      pdf.make_cell(:content => ia.tax.value.to_s, :font => "Courier", :size => 9, :align => :right)
    ]], :column_widths => widths)
end


pdf.move_down(15)



pdf.text "Modalità di Pagamento:", :align => :left, :size => 10, :style => :bold
pdf.text "#{@invoice.payment_method.try(:name)}", :font => "Courier", :size => 10, :align => :left
pdf.text "Scadenze di Pagamento:", :align => :left, :size => 10, :style => :bold
@invoice.payment_deadlines.each do |pd|
pdf.text "#{pd.data.strftime "%d-%m-%Y"} - #{number_to_currency(pd.price, :unit=>'€.', precision: 2, :delimiter=>'.', :separator=>',')}", :font => "Courier", :size => 10, :align => :left
end
unless @invoice.note.empty?
pdf.text "Note:",  :align => :left, :size => 10, :style => :bold
pdf.text "#{@invoice.try(:note)}", :align => :left, :size => 10
end


pdf.move_down(0)


pdf.text "Imponibile:   #{number_to_currency(@invoice.total_pretax, :unit=>'€. ', precision: 2, :delimiter=>'.', :separator=>',')}", :align => :right, :size => 10
pdf.text "Importo Iva:   #{number_to_currency(@invoice.total_tax_price, :unit=>'€. ', precision: 2, :delimiter=>'.', :separator=>',')}", :align => :right, :size => 10
pdf.text "TOTALE:   #{number_to_currency(@invoice.total_price, :unit=>'€. ', :delimiter=>'.', :separator=>',', precision: 2)}", :align => :right, :size => 10, :style => :bold


pdf.move_down(0)

pdf.move_down(10)

if !@invoice.other.empty?
pdf.text "Altro", :align => :left, :size => 10, :style => :bold
pdf.text "#{@invoice.other}", :align => :left, :size => 9
end

pdf.move_down(20)







