class CreateTeeRating < ActiveRecord::Migration
  def change
    create_table :tee_ratings do |t|
      t.integer :golf_course_id, null: false
      t.integer :slope_rating, null: false
      t.integer :course_rating, null: false
      t.string :color, null: false
    end
  end
end
