class ChangeDatesColumnAddNullFalse < ActiveRecord::Migration
  def up
    change_column :scores, :date, :string, null: false
    change_column :scores, :golf_course_id, :integer, null: false
    change_column :scores, :user_id, :integer, null: false
  end

  def down
    change_column :scores, :date, :string, null: true
    change_column :scores, :golf_course_id, :integer, null: true
    change_column :scores, :user_id, :integer, null: true
  end
end
