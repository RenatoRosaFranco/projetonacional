class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string 	 :name
      t.string 	 :email
      t.string 	 :profile

      t.timestamps
    end
  end
end
