class AddNullConstraintToScoreTeeRatingId < ActiveRecord::Migration
  def up
    change_column :scores, :tee_rating_id, :integer, null: false
  end

  def up
    change_column :scores, :tee_rating_id, :integer, null: true
  end
end
