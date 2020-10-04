class Question < ActiveRecord::Base
  belongs_to :category
  has_many :answers
  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true


  def totale
  	totale = Questionariodatum.where('question_id =?', self.id).count
  end

end
