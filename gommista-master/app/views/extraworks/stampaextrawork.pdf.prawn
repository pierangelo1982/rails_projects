
logo = "public/img/logo_delbarba.png"
pdf.image logo, :scale => 0.5

pdf.text "Data: #{@extrawork.data.strftime "%d-%m-%Y"}", :align => :right, :size => 17
pdf.move_down(30)
pdf.text "Cliente: #{@extrawork.car.owner.denominazione}", :align => :right, :size => 17
pdf.text "Veicolo: #{@extrawork.car.marca} - #{@extrawork.car.modello}", :align => :right, :size => 17
pdf.text "Targa: #{@extrawork.car.targa}", :align => :right, :size => 17
pdf.text "Km: #{@extrawork.km}", :align => :right, :size => 17

pdf.move_down(30)



widths = [200,120,100,100]
cell_height = 20

pdf.table([["Descrizione",  "Quantità", "Codice", "importo"]], :column_widths => widths, :row_colors => ["F0F0F0", "FFFFCC"], :cell_style => { size: 12 } )


Extralavorowork.where(extrawork_id: @extrawork.id).each do |ww|
pdf.table([[
      pdf.make_cell(:content => ww.catextrawork.nome,  :height => cell_height, :font => "Courier", :size => 12),
      pdf.make_cell(:content => ww.quantita, :height => cell_height, :font => "Courier", :size => 12),
      pdf.make_cell(:content => ww.codice,    :height => cell_height, :font => "Courier", :size => 10, :align => :left),
      pdf.make_cell(:content => "€. #{ww.importo}",    :height => cell_height, :font => "Courier", :size => 12, :align => :right)
    ]], :column_widths => widths)
end
Scriviwork.where(extrawork_id: @extrawork.id).each do |ww|
pdf.table([[
      pdf.make_cell(:content => ww.descrizione,  :height => cell_height, :font => "Courier", :size => 12),
      pdf.make_cell(:content => ww.quantita.to_s, :height => cell_height, :font => "Courier", :size => 12),
      pdf.make_cell(:content => ww.codice,    :height => cell_height, :font => "Courier", :size => 10, :align => :left),
      pdf.make_cell(:content => "€. #{ww.importo}",    :height => cell_height, :font => "Courier", :size => 12, :align => :right)
    ]], :column_widths => widths)
end
pdf.move_down(30)
pdf.text "ORE MANODOPERA: #{@extrawork.tempo.strftime "%R"}", :align => :left, :size => 14
pdf.move_down(30)
pdf.text "NOTE:", :align => :left, :size => 12
pdf.text "#{@extrawork.note}", :align => :left, :size => 14
pdf.move_down(30)
pdf.text "Importo Totale: €. #{@extrawork.try(:prezzo)}", :align => :right, :size => 17

