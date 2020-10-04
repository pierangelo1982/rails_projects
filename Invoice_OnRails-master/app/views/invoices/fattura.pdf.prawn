pdf.text "CARBURANTI SPECIALI s.r.l.", :align => :center, :size => 16
pdf.text "P.IVA: e Cod.Fisc: 08613720963", :align => :center, :size => 10
pdf.text "Via Unione, 3 - 20122 Milano", :align => :center, :size => 10
pdf.text "R.E.A nr. MI 2037107 - Capitale Sociale €. 10.000", :align => :center, :size => 10


pdf.move_down(30)

if !@invoice.custumer.address.nil? && !@invoice.custumer.address.via.empty?
pdf.text "Da Inviare a: #{@invoice.custumer.denominazione}", :align => :right, :size => 12, :style => :bold
pdf.text "Via: #{@invoice.custumer.address.via}", :align => :right, :size => 10
pdf.text "#{@invoice.custumer.address.cap}, #{@invoice.custumer.address.citta}", :align => :right, :size => 10
else
pdf.text "Spett.le: #{@invoice.custumer.denominazione}", :align => :right, :size => 12, :style => :bold
pdf.text "P.iva: #{@invoice.custumer.piva}", :align => :right, :size => 10
pdf.text "CodFisc: #{@invoice.custumer.codfisc}", :align => :right, :size => 10
pdf.text "Via: #{@invoice.custumer.indirizzo}", :align => :right, :size => 10
pdf.text "#{@invoice.custumer.cap}, #{@invoice.custumer.citta}", :align => :right, :size => 10
end


if !@invoice.custumer.address.nil? && !@invoice.custumer.address.via.empty?
pdf.text "Spett.le: #{@invoice.custumer.denominazione}", :align => :left, :size => 12, :style => :bold
pdf.text "P.iva: #{@invoice.custumer.piva}", :align => :right, :left => 10
pdf.text "CodFisc: #{@invoice.custumer.codfisc}", :align => :left, :size => 10
pdf.text "Via: #{@invoice.custumer.indirizzo}", :align => :left, :size => 10
pdf.text "#{@invoice.custumer.cap}, #{@invoice.custumer.citta}", :align => :left, :size => 10
pdf.move_down(-30)
end

pdf.move_down(40)


pdf.text "Fattura Numero: #{@invoice.numero} #{@invoice.cod_comune}, Del: #{@invoice.data.strftime "%d-%m-%Y"}", :align => :left, :size => 10


pdf.move_down(10)


widths = [60,190,50,90,90,60]
#cell_height = 17

pdf.table([["Cod.Art", "Descrizione",  "Quantità", "Prezzo Unitario", "Importo", "Iva"]], :column_widths => widths, :row_colors => ["F0F0F0", "FFFFCC"], :cell_style => { size: 9 } )

if @invoice.rifornimenti == true
pdf.table([[
      pdf.make_cell(:content => "", :font => "Courier", :size => 9),
      pdf.make_cell(:content => "FATTURAZIONE DEI VS. RIFORNIMENTI EFFETTUATI NEL MESE DI #{@invoice.mese}\n
               PRESSO IL NOSTRO DISTRIBUTORE STRADALE DI #{@invoice.distributore}", :font => "Courier", :size => 9),
      pdf.make_cell(:content => "",  :font => "Courier", :size => 9, :align => :right),
      pdf.make_cell(:content => "", :font => "Courier", :size => 9, :align => :right),
      pdf.make_cell(:content => "", :font => "Courier", :size => 9, :align=>:right),
      pdf.make_cell(:content => "",   :font => "Courier", :size => 9, :align => :right)
    ]], :column_widths => widths)
end


@invoice.invoice_articles.each do |ia|
pdf.table([[
      pdf.make_cell(:content => ia.try(:codice), :font => "Courier", :size => 9),
      if ia.articles.empty? 
      pdf.make_cell(:content => "#{ia.titolo} \n #{ia.descrizione}", :font => "Courier", :size => 9)
      else
      pdf.make_cell(:content => "#{ia.articles} \n #{ia.descrizione}", :font => "Courier", :size => 9)
      end,
      pdf.make_cell(:content => ia.quantita.to_s,  :font => "Courier", :size => 9, :align => :right),
      pdf.make_cell(:content => "#{number_to_currency(ia.prezzo_unitario, :unit=>'€.', precision: 3, :delimiter=>'.', :separator=>',')}", :font => "Courier", :size => 9, :align => :right),
      pdf.make_cell(:content => "#{number_to_currency(ia.importo, :unit=>'€.', precision: 3, :delimiter=>'.', :separator=>',')}", :font => "Courier", :size => 10, :align=>:right),
      pdf.make_cell(:content => ia.tax.codice, :font => "Courier", :size => 9, :align => :right)
    ]], :column_widths => widths)
end

pdf.move_down(15)


pdf.text "CONAI ASSOLTO OVE DOVUTO", :align => :left, :size => 10, :style => :bold



pdf.move_down(20)


pdf.text "Modalità di Pagamento:", :align => :left, :size => 10, :style => :bold
pdf.text "#{@invoice.payment_type.try(:titolo)}"
pdf.text "Scadenze di Pagamento:", :align => :left, :size => 10, :style => :bold
@invoice.payment_deadlines.each do |pd|
pdf.text "#{pd.data.strftime "%d-%m-%Y"}"
end
pdf.text "Note:",  :align => :left, :size => 10, :style => :bold
pdf.text "#{@invoice.try(:note)}", :align => :left, :size => 10


pdf.move_down(0)


pdf.text "Imponibile:   #{number_to_currency(@invoice.imponibile, :unit=>'€. ', precision: 2, :delimiter=>'.', :separator=>',')}", :align => :right, :size => 10
pdf.text "Iva: #{@invoice.tax.try(:titolo)}", :align => :right, :size => 10
pdf.text "Importo Iva:   #{number_to_currency(@invoice.totale_iva, :unit=>'€. ', precision: 2, :delimiter=>'.', :separator=>',')}", :align => :right, :size => 10
pdf.text "TOTALE:   #{number_to_currency(@invoice.totale, :unit=>'€. ', :delimiter=>'.', :separator=>',', precision: 2)}", :align => :right, :size => 10, :style => :bold


pdf.move_down(0)


pdf.text "Coordinate Bancarie:", :align => :left, :size => 10, :style => :bold
pdf.text "BANCA CARIGE", :align => :left, :size => 10
pdf.text "Iban: IT 27 034331 01600 000005661080", :align => :left, :size => 10


pdf.move_down(10)


pdf.text "AVVISO IMPORTANTE: il Vs. indirizzo che appare sul presente documento sarà quello che verrà utilizzato salvo Vs diversa precisazione, agli effetti dell' art. 29 d.p.r. 26/10/1972 n. 633 - decreto IVA. Con questo avviso ci consideriamo esonerati da qualsiasi responsabilità prevista dall'art. 41 D.P.R. n. 633/1977", :align => :left, :size => 9


pdf.move_down(20)


pdf.text "Carburanti Speciali s.r.l. raccoglie presso di sè e tratta con modalità connesse ai fini, i dati personali il cui trattamento si renda necessario per l'adempimento degli obblighi derivati da un rapporto commerciale (informativa D.lgs. N.196 del 30/06/2003).", :align => :left, :size => 9


