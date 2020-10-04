logo = "public/img/logofucsia.png"
pdf.image logo, :scale => 0.7

pdf.move_down(-40)
pdf.text "QUESTIONARIO 2015", :align => :right, :size => 14



pdf.move_down(40)

@questionario.questionariodata.each do |questionario|
pdf.text "#{questionario.question.try(:codice)} - #{questionario.question.try(:question)}", :align => :left, :size => 12, :style => :bold
pdf.text "#{questionario.answer.try(:option)}", :align => :left, :size => 12
if questionario.altro.present?
pdf.text "Altro: #{questionario.try(:altro) }", :align => :left, :size => 12
end
pdf.move_down(15)

end


