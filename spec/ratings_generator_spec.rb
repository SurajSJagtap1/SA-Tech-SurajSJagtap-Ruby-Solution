require_relative '../ratings_generator'

RSpec.describe RatingsGenerator do
    it 'should reach code' do
        RatingsGenerator.new.do_prompt
    end
end