
class Adventure < ActiveRecord::Base
  has_and_belongs_to_many :chapters
  validates :username, presence: true
  validates :username, uniqueness: true
  after_create :fresh_adventure

  def add_chapter chapter
    self.chapters << chapter unless self.chapters.include?(chapter)
  end

  def fresh_adventure
  	self.add_chapter(Chapter.prologue)
  end
end