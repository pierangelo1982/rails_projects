class CreateQuestionarios < ActiveRecord::Migration
  def change
    create_table :questionarios do |t|
      t.text :altro

      t.timestamps
    end
  end
end
