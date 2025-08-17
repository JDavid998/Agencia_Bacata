class CreateAdAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :ad_accounts do |t|
      t.string :provider
      t.string :account_id
      t.string :access_token
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
