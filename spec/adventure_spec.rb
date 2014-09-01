require 'rails_helper'

describe Adventure do
	it { should have_and_belong_to_many :chapters }
	it { should validate_presence_of :username }
end