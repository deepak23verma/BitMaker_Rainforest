class AddFlickrUsernameAndInstagramUsernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :flickr_username, :string
    add_column :users, :instagram_username, :string
  end
end
