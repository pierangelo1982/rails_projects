class Answer < ActiveRecord::Base
  belongs_to :question

  def totale
  	totale = Questionariodatum.where('answer_id =?', self.id).count
  end

end
