class AddLocationColumnToGolfCourses < ActiveRecord::Migration
  def change
    add_column :golf_courses, :location, :string, null: false
  end
end
