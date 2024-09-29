# Tendable Coding Assessment
## Usecase
  The application asks you the questions related to your skillset in various programming languages and calculates the ratings based on your answers.

## Setup Requirements
1) You should have ruby-2.7.2 installed on your system.
2) Clone this repository to your local.
3) Check inside the repository (`cd SA-Tech-SurajSJagtap-Ruby-Solution`) and run `bundle` (to isntall required gems)
3) then run `ruby ratings_generator.rb` to run the application.
4) Answer the questions appropriately and you will get the ratings calculated for the current run as well as your overall average ratings.

## My Approach of implementation.
* I have used class-based code design to solve this problem, where I have modularised my code across multiple small methods for ensuring Single Responsibility to each of the method. This makes it easy to debug, maintain and extend the code.
* I have written separate methods for asking questions, calculating ratings (both current and overall), storing the answers into pstore.
* I have added validation on answers, so user answers the questions in a particular options [Yes, No, y, n] (Case Insensitive)
* If user answers the question incorrectly, he is prompted with allowed answers and that question continues until user answers it appropriately.
* constants are kept in a separate file to maintain the cleanliness of the code.

