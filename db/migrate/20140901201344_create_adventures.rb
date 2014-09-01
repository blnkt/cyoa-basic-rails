class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
    	t.string :username
      t.timestamps
    end
  end
end
