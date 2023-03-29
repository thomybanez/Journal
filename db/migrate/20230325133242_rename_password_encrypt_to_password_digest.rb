class RenamePasswordEncryptToPasswordDigest < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :password_encrypt, :password_digest
  end
end
