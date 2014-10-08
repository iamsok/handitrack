class AddScoreToGolfCourse < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :score, null: false
    end
  end
end

