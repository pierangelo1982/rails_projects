pdf.text "TEST GENERAZIONE PDF"


pdf.text "Targa Veicolo: #{@car.targa}"
pdf.text "Denominazione: #{@car.owner.denominazione}"
pdf.text "Veicolo: #{@car.marca}, #{@car.modello}"
pdf.text "Anno #{@car.marca}"

barcode = "app/assets/images/barcodes/#{@car.targa}.png"
pdf.image barcode, :scale => 1
