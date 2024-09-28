STORE_NAME = "tendable.pstore"

QUESTIONS = {
  "q1" => "Can you code in Ruby?",
  "q2" => "Can you code in JavaScript?",
  "q3" => "Can you code in Swift?",
  "q4" => "Can you code in Java?",
  "q5" => "Can you code in C#?"
}.freeze

ALLOWED_ANSWERS = ['yes', 'no', 'y', 'n'].freeze # Even if user enters it in upcase, we are downcasing it at the time checking into this array