class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :category, index: true
      t.string :codice
      t.string :question
      t.text :note

      t.timestamps
    end
  end
end
