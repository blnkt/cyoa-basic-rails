require 'spec_helper'
describe Chapter do

	it { should have_and_belong_to_many :adventures}
	it { should have_many :choices }
	it { should belong_to  :parent_chapter }
	it { should validate_presence_of :prompt }
	it { should validate_presence_of :episode }

	
	describe '#add_choice' do
	  it "add a choice to a chapter" do
	    beatles_chapter = Chapter.create({prompt: "glasses", episode: "they came in through the bathroom window"})
	    beatles_chapter.add_choice('there is no silver spoon')
	    expect(beatles_chapter.choices.first.parent_chapter_id).to eq(beatles_chapter.id)
	  end
	end

	describe '.prologue' do
	  it 'adds the prologue if it isnt present in the database already' do
	    first_chap = Chapter.create({prompt: "Welcome to the Adventure", episode: "You awake in a field..."})
	    expect(Chapter.prologue).to eq(first_chap)
	  end
	end
end