class RemoveProfilePhotoFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :profile_photo, :string
  end
end
