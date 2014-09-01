
class Adventure < ActiveRecord::Base
  has_and_belongs_to_many :chapters
  validates :username, presence: true

  def add_chapter chapter
    self.chapters << chapter unless self.chapters.include?(chapter)
  end
end