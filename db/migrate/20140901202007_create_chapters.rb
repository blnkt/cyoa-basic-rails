class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
    	t.string :prompt
    	t.text :episode
    	t.references :parent_chapter
    	t.timestamps
    end
  end
end
