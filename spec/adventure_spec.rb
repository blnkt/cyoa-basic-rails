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

	describe "#fresh_adventure" do
	  it "add the prologue to a new adventure on it's instantiation" do
	    new_adventure = Adventure.create(username: 'billy')
	    expect(new_adventure.chapters.last.prompt).to eq("Welcome to the Adventure")
	  end
  end

  	describe "#fresh_adventure" do
	  it "add the prologue to a new adventure on it's instantiation if it isn't present already" do
	    new_adventure = Adventure.create(username: 'billy')
	    new_adventure.fresh_adventure
	    expect(new_adventure.chapters.length).to eq(1)
	  end
  end
end