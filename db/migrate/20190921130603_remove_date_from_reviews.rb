class RemoveDateFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :date
  end
end
