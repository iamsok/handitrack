class AddColumnTeeRatingIdToScore < ActiveRecord::Migration
  def change
    add_column :scores, :tee_rating_id, :integer
  end
end
