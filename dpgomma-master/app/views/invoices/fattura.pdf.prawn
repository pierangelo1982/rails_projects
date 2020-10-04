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


