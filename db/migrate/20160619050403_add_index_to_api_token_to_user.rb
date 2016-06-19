class AddIndexToApiTokenToUser < ActiveRecord::Migration[5.0]
  def change
  	add_index :users, :api_token, unique: true
  end
end
