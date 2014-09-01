class CreateAdventuresChapters < ActiveRecord::Migration
  def change
    create_table :adventures_chapters do |t|
    	t.belongs_to :adventure
    	t.belongs_to :chapter
    end
  end
end
