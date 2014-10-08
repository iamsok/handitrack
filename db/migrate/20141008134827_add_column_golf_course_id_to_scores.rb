class AddColumnGolfCourseIdToScores < ActiveRecord::Migration
  def change
    add_column :scores, :golf_course_id, :integer
  end
end
