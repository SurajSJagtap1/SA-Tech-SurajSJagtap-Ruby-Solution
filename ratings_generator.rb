require "pstore" # https://github.com/ruby/pstore
require "pry"
require "./constants"

store = PStore.new(STORE_NAME)

class RatingsGenerator
  # TODO: FULLY IMPLEMENT
  def do_prompt
    # Ask each question and get an answer from the user's input.
    p 'Whats your goodname?: '
    developer_name = gets.chomp

    QUESTIONS.each_key do |question_key|
      print "#{QUESTIONS[question_key]}\n"
      ans = gets.chomp
    end
  end

  def do_report
    # TODO: IMPLEMENT
  end
end

RatingsGenerator.new().do_prompt

