class AddDateToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :date, :datetime
  end
end
