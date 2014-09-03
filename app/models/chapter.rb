
class Chapter < ActiveRecord::Base
  has_and_belongs_to_many :adventures
  has_many :choices, class_name: 'Chapter', foreign_key: 'parent_chapter_id'
  belongs_to :parent_chapter, class_name: 'Chapter'
  validates :prompt, presence: true

  scope :prologue, -> {find_or_create_by({prompt: "Welcome to the Adventure", episode: "You awake in a field..."}) do |chapter|  
    a1 = "pick up the keys and walk to the road"
    a2 = "Walk the bike out of the field to a nearby road"
    a3 = "Put on the hat and head towards the sound of water"
    chapter.add_choice(a1)
    chapter.add_choice(a2)
    chapter.add_choice(a3)
    a1a = 
    a2a = 
    a3a =
    Chapter.find_by(prompt: a1).update(episode: a1a)
    Chapter.find_by(prompt: a2).update(episode: a2a)
    Chapter.find_by(prompt: a3).update(episode: a3a)
  end}

  def add_choice prompt
    choice = Chapter.create({prompt: prompt, parent_chapter_id: self.id})
    self.choices << choice
  end

end 