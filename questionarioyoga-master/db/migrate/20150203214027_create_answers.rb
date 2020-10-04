class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :codice
      t.belongs_to :question, index: true
      t.string :option
      t.string :note

      t.timestamps
    end
  end
end
