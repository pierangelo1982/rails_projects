class CreateQuestionariodata < ActiveRecord::Migration
  def change
    create_table :questionariodata do |t|
      t.belongs_to :questionario, index: true
      t.belongs_to :question, index: true
      t.belongs_to :answer, index: true

      t.timestamps
    end
  end
end
