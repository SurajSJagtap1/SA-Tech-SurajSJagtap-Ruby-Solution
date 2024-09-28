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

  def collect_answers # Asks questions and collects user's answers for the survey
    answers = []
    QUESTIONS.each_key do |question_key|
      print "#{QUESTIONS[question_key]}:\n"
      ans = gets.chomp.downcase
      answers.push(ans) if is_answer_valid?(question_key, ans)
    end
    answers
  end

  def is_answer_valid?(question_key, ans)  # Validates user's answers for a particular question
    return true if ALLOWED_ANSWERS.include?(ans)
    puts "Please select your answer from following options:  #{ALLOWED_ANSWERS}\n(Case Insensitive answers are FINE)\n"
    print "\n#{QUESTIONS[question_key]}: "
    ans = gets.chomp.downcase
    is_answer_valid?(question_key, ans)   # Recursive call to the same method until user inputs the appropriate answer
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

