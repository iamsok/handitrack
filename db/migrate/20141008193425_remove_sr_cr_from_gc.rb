class RemoveSrCrFromGc < ActiveRecord::Migration
  def change
    remove_column :golf_courses, :slope_rating, :integer
    remove_column :golf_courses, :course_rating, :integer
  end
end
