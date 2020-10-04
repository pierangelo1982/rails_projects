class Questionariodatum < ActiveRecord::Base
  belongs_to :questionario
  belongs_to :question
  belongs_to :answer
end
