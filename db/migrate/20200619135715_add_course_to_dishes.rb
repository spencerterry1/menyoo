class AddCourseToDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :course, :string
  end
end
