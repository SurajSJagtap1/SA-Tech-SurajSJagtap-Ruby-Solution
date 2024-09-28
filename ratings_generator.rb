require "pstore" # https://github.com/ruby/pstore
require "pry"
require "./constants"

store = PStore.new(STORE_NAME)

class RatingsGenerator
  def do_prompt
    answers = collect_answers
    rating_for_current_run = calculate_rating_for_current_run(answers)
    puts "Your Rating for this survey is: #{rating_for_current_run}\n"
  end

  private

  def collect_answers # Asks and validates user's answers for the survey
    QUESTIONS.each_key do |question_key|
      print "#{QUESTIONS[question_key]}\n"
      ans = gets.chomp
      answers.push(ans)
    end
  end

  def calculate_rating_for_current_run(answers)
    yes_count = answers.select{|answer|  answer == 'yes' || answer == 'y'}.count
    ( 100 * yes_count / QUESTIONS.keys.count )
  end

  def do_report
    # TODO: IMPLEMENT
  end
end

RatingsGenerator.new().do_prompt

