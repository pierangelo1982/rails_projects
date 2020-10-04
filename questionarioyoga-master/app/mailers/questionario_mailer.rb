class QuestionarioMailer < ActionMailer::Base
  default from: "pierangelo1982@gmail.com"
 
  def questionario_email(questionario)
    @questionario = questionario
    @url  = 'http://example.com/login'
    mail(to: 'pierangelo1982@gmail.com, yoga.wellness@gmail.com', subject: 'Risposta a Questionario') do |format|
      format.html { render layout: 'applicationx' }
  end
  end
end
