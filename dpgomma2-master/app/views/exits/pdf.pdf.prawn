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


pdf.text "Sptt.le: #{@exit.azienda.denominazione}", :align => :left, :size => 12
pdf.text "P.iva: #{@exit.azienda.piva}", :align => :left, :size => 12
pdf.text "CodFisc: #{@exit.azienda.codfisc}", :align => :left, :size => 12
pdf.text "Via: #{@exit.azienda.indirizzo}", :align => :left, :size => 12
pdf.text "#{@exit.azienda.cap}, #{@exit.azienda.citta}", :align => :left, :size => 12

pdf.move_down(30)


pdf.text "DDT Numero: #{@exit.number_exit}, Del: #{@exit.data.strftime "%d-%m-%Y"}"


pdf.move_down(30)




widths = [150,210,60,50,60]
cell_height = 20

pdf.table([["Articolo", "Lavorazione", "Quantita Lavorata", "Quantita Non Lavorata", "Quantita Totale"]], :column_widths => widths, :row_colors => ["F0F0F0", "FFFFCC"], :cell_style => { size: 10 })


@exit.exitdata.where('quantita >? OR reso >?', '0', '0').each do |ex|
pdf.table([[
      pdf.make_cell(:content => ex.lavorazione.pezzo.nome,  :height => cell_height, :font => "Courier"),
      if ex.inscatolamentoprezzo > 0
      pdf.make_cell(:content => "#{ex.lavorazione.titolo} e inscatolamento", :height => cell_height, :font => "Courier")
      else
      pdf.make_cell(:content => "#{ex.lavorazione.titolo}", :height => cell_height, :font => "Courier")
      end,
      pdf.make_cell(:content =>  number_with_delimiter(ex.quantita.to_s, delimiter: "."), :height => cell_height, :font => "Courier"),
      pdf.make_cell(:content => number_with_delimiter(ex.reso.to_s, delimiter: "."), :height => cell_height, :font => "Courier"),
      pdf.make_cell(:content => number_with_delimiter(ex.quantitatotale.to_s, delimiter: "."), :height => cell_height, :font => "Courier")
    ]], :column_widths => widths, :cell_style => { size: 10 })
end



pdf.move_down(30)


pdf.text "Colli: #{@exit.colli}"
pdf.text "Totale Lavorati: #{number_with_delimiter(@exit.exitdata.sum(:quantita),delimiter: ".")}"
pdf.text "Totale Resi non Lavorati: #{number_with_delimiter(@exit.exitdata.sum(:reso), delimiter: ".")}"
pdf.text "Totale: #{number_with_delimiter(@exit.exitdata.sum(:quantita) + @exit.exitdata.sum(:reso), delimiter: ".")}"
pdf.text "Vettore: #{@exit.responsabile_trasporto}"
pdf.text "Aspetto dei Beni: #{@exit.aspetto}"



pdf.move_down(30)


pdf.text "Firma Conducente:", :align => :left, :size => 12
pdf.move_down(30)
pdf.text "..........................................", :align => :left, :size => 12


pdf.move_down(-60)


pdf.text "Firma Destinatario:", :align => :right, :size => 12
pdf.move_down(30)
pdf.text "..........................................", :align => :right, :size => 12













