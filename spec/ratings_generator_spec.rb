require_relative '../ratings_generator'

RSpec.describe RatingsGenerator do
    it 'should ask questions and calculate ratings based on answers' do
        RatingsGenerator.new.do_prompt
    end
end