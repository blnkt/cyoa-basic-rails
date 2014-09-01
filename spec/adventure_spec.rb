require 'rails_helper'

describe Adventure do
	it { should have_and_belong_to_many :chapters }
	it { should validate_presence_of :username }

	describe "#add_chapter" do
	  it "add a chapter to an adventure" do
	    new_adventure = Adventure.create(username: 'billy')
	    unexpected_astronaut = Chapter.create({prompt: "Unexpected Astronaut"})
	    new_adventure.add_chapter(unexpected_astronaut)
	    expect(new_adventure.chapters.last).to eq(unexpected_astronaut)
	  end
	end
end