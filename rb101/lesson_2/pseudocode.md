Sample exercises from Pseudo-Code lesson.

Write out pseudo-code (both casual and formal) that does the following:


1. a method that returns the sum of two integers

(Casual)

Passing two integers in as arguments.

Return the value of the sum of the two integers.

(Formal)

START

Passing two integers in as arguments (int1, int2).

PRINT int1 + int2.

END


2. a method that takes an array of strings, and returns a string that is all those strings concatenated together

(Casual)

Given an array of strings.

Initialize a "result_string" variable to an empty string.

Iterate through the array:
  - Add current element of the array onto result_string.
  - Add space character result_string (for readability).

Return the result_string.

(Formal)

START

Given an array of strings called "strings".

SET result_string = empty string
SET iterator = 0

WHILE iterator < length of strings
  result_string = result_string + string in strings at space "iterator" + space character
  iterator = iterator + 1

PRINT result_string

END


3. a method that takes an array of integers, and returns a new array with every other element

(Casual)

Given an array of integers.

Assign counter variable to 0.
Initialize a "new_array" variable to an empty array.

Iterate through the array:
  - Use counter variable to compare to current index number of array.
  - If counter variable is an even number, add it to the new_array.
  - If counter is an odd number, don't add current element of array.
  - Add one to the counter number.

Return the new_array.

(Formal)

START

Given an array of integers called "integers".

SET new_array = empty array
SET counter = 0

WHILE counter < length of integers
  IF counter is an even number
    new_array = new_array + current integer at space "counter"
  ELSE
    go to the next iteration

  counter = counter + 1

PRINT new_array 

END
