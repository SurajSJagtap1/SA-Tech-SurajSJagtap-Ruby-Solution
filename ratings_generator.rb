require "pstore" # https://github.com/ruby/pstore
require "pry"
require "./constants"

class RatingsGenerator
  @@store = PStore.new(STORE_NAME)
  def do_prompt
    answers_for_current_run = collect_answers
    store_answers(answers_for_current_run)
    puts "Your Rating for current survey is: #{calculate_rating_for_current_run(answers_for_current_run)}\n"
  end

  private

  def store_answers(answers_for_current_run)   # persists answers for all the runs
    if @@store.transaction { @@store['all_answers'] }.nil?
      @@store.transaction { @@store['all_answers'] = [answers_for_current_run] }
    else
      @@store.transaction { @@store['all_answers'].push(answers_for_current_run) }
    end
  end

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

