class ChangeSlopeRatingColumn < ActiveRecord::Migration
  def up
    change_column :golf_courses, :slope_rating, :integer, null: false
  end

  def down
    change_column :golf_courses, :slope_rating, :float, null: false
  end
end
