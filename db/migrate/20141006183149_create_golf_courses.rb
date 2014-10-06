class CreateGolfCourses < ActiveRecord::Migration
  def change
    create_table :golf_courses do |t|
      t.string :name, null: false
      t.integer :course_rating, null: false
      t.integer :slope_rating, null: false
    end
  end
end
