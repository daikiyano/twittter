class RenameTwitterIdToTweeet < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments,:twitter_id,:tweeet_id
  end
end
