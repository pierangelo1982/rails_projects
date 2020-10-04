logo = "public/img/logox.jpg"
pdf.image logo, :scale => 0.7

pdf.move_down(-90)
pdf.text "DP GOMMA di Plebani Donatello", :align => :right, :size => 12
pdf.text "	P.IVA: 040108400165  Cod.Fisc: PLBDTL76M05L437D", :align => :right, :size => 12
pdf.text "	Via Pescarie, 11  -  24060 Foresto Sparso (BG)", :align => :right, :size => 12
pdf.text "Tel. e Fax. Tel: +39.035.4427375", :align => :right, :size => 12
pdf.text "info@dpgomma.it  -  pec: plebanid@legalmail.it", :align => :right, :size => 12
pdf.text "www.dpgomma.it", :align => :right, :size => 12


pdf.move_down(30)


pdf.text "Sptt.le: #{@invoice.azienda.denominazione}", :align => :left, :size => 12
pdf.text "P.iva: #{@invoice.azienda.piva}", :align => :left, :size => 12
pdf.text "CodFisc: #{@invoice.azienda.codfisc}", :align => :left, :size => 12
pdf.text "Via: #{@invoice.azienda.indirizzo}", :align => :left, :size => 12
pdf.text "#{@invoice.azienda.cap}, #{@invoice.azienda.citta}", :align => :left, :size => 12


pdf.move_down(30)


pdf.text "Fattura Numero: #{@invoice.number_invoice}, Del: #{@invoice.data.strftime "%d-%m-%Y"}"


pdf.move_down(30)



widths = [100,190,50,50,50,70]
cell_height = 17

pdf.table([["Cod.Art", "Descrizione",  "Quantità", "Prezzo Unitario", "Sconto", "importo"]], :column_widths => widths, :row_colors => ["F0F0F0", "FFFFCC"], :cell_style => { size: 10 } )



@invoice.exits.each do |exit|
exit.exitdata.where('quantita >? OR reso >?', '0', '0').each do |ex|
pdf.table([[
      pdf.make_cell(:content => ex.lavorazione.pezzo.nome,  :height => cell_height, :font => "Courier", :size => 10),
      if ex.inscatolamentoprezzo > 0 
      pdf.make_cell(:content => "#{ex.lavorazione.titolo} + inscatolamento", :height => cell_height, :font => "Courier", :size => 10)
      else
      pdf.make_cell(:content => ex.lavorazione.titolo,    :height => cell_height, :font => "Courier", :size => 10)
      end,
      pdf.make_cell(:content => ex.quantita.to_s,    :height => cell_height, :font => "Courier", :size => 10, :align => :right),
      pdf.make_cell(:content => ex.lavorazione.prezzo.to_s, :height => cell_height, :font => "Courier", :size => 10, :align => :right),
      pdf.make_cell(:content => ex.lavorazione.sconto, :height => cell_height, :font => "Courier", :size => 10),
      pdf.make_cell(:content => number_to_currency(ex.exitdatumtotale, :unit=>'€. '),    :height => cell_height, :font => "Courier", :size => 10, :align => :right)
    ]], :column_widths => widths)
end
end


@invoice.invoiceextras.each do |invoiceextra|
pdf.table([[
      pdf.make_cell(:content => invoiceextra.try(:codice),  :height => cell_height, :font => "Courier", :size => 10),
      pdf.make_cell(:content => invoiceextra.descrizione, :height => cell_height, :font => "Courier", :size => 10),
      pdf.make_cell(:content => invoiceextra.quantita.to_s, :height => cell_height, :font => "Courier", :size => 10, :align => :right),
      pdf.make_cell(:content => invoiceextra.prezzounitario.to_s, :height => cell_height, :font => "Courier", :size => 10, :align => :right),
      pdf.make_cell(:content => "", :height => cell_height, :font => "Courier", :size => 10),
      pdf.make_cell(:content => number_to_currency(invoiceextra.prezzo, :unit=>'€. '),    :height => cell_height, :font => "Courier", :size => 10, :align => :right)
    ]], :column_widths => widths)
end


if @invoice.taxation.valore == 0
	pdf.move_down(30)
	pdf.text "N.B: #{@invoice.taxation.descrizione}", :align => :left, :size => 12, :style => :bold
end


pdf.move_down(30)

pdf.text "Modalità di Pagamento:", :align => :left, :size => 12, :style => :bold
pdf.text "#{@invoice.pagamento}"
pdf.text "Scadenze di Pagamento:", :align => :left, :size => 12, :style => :bold
@invoice.scadenzapagamentos.each do |scadenzapagamento|
pdf.text "#{scadenzapagamento.scadenza.strftime "%d-%m-%Y"}"
end


pdf.move_down(30)

pdf.text "Coordinate Bancarie:", :align => :left, :size => 12, :style => :bold
@invoice.azienda.banks.each do |bank|
pdf.text "#{bank.try(:nome)}", :align => :left, :size => 12
pdf.text "ABI: #{bank.try(:abi)}", :align => :left, :size => 12
pdf.text "CAB: #{bank.try(:cab)}", :align => :left, :size => 12
pdf.text "C.C. #{bank.try(:numeroconto)}", :align => :left, :size => 12
pdf.text "Iban: #{bank.try(:iban)}", :align => :left, :size => 12
end


pdf.move_down(-30)

pdf.text "Imponibile:   #{number_to_currency(@invoice.netto, :unit=>'€. ')}", :align => :right, :size => 12
pdf.text   "Iva: #{@invoice.taxation.titolo}", :align => :right, :size => 12
pdf.text "Importo Iva:   #{number_to_currency(@invoice.tax, :unit=>'€. ')}", :align => :right, :size => 12
pdf.text "TOTALE:   #{number_to_currency(@invoice.totale, :unit=>'€. ')}", :align => :right, :size => 12, :style => :bold



