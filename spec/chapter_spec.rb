require 'spec_helper'
describe Chapter do

	it { should have_and_belong_to_many :adventures}
	it { should have_many :choices }
	it { should belong_to  :parent_chapter }
	it { should validate_presence_of :prompt }
	
	describe '#add_choice' do
	  it "add a choice to a chapter" do
	    beatles_chapter = Chapter.create({prompt: "glasses", episode: "they came in through the bathroom window"})
	    beatles_chapter.add_choice("sex")
	    expect(beatles_chapter.choices.first.prompt).to eq("sex")
	    expect(beatles_chapter.choices.first.parent_chapter_id).to eq(beatles_chapter.id)
	  end
	end

	describe '.prologue' do
	  it 'adds the prologue if it isnt present in the database already' do
	    first_chap = Chapter.create({prompt: "Welcome to the Adventure", episode: "You awake in a field.  Your limbs ache.  Your mind is fuzzy; full of star-stuffs.  You here only the birds.  You try to stand to better get your bearings int he hot noonday sun but find your knees and elbows particularly weak.  You return to the ground and resign yourself to acclimating more slowly to your surroundings."})
	    expect(Chapter.prologue).to eq(first_chap)
	  end
	end
end