class DeleteColumnGolfCourseIdFromScores < ActiveRecord::Migration
  def change
    remove_column :scores, :golf_course_id, :integer
  end
end
