class AddColumnAltroToQuestionariodatum < ActiveRecord::Migration
  def change
    add_column :questionariodata, :altro, :string
  end
end
