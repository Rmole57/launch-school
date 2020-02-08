#!/bin/bash

# test for length of string:
string='Hello'

if [[ -n $string ]]
then
  echo $string
fi

# test for integer equality:
integer_1=10
integer_2=10

if [[ $integer_1 -eq $integer_2 ]]
then
  echo $integer_1 and $integer_2 are the same!
fi

# test if file exists:
if [[ -e ./hello_world.sh ]]
then
  echo 'File exists'
fi

# nested if statement:
integer=4

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10

  if [[ $integer -lt 5 ]]
  then
    echo $integer is also less than 5
  fi
fi

# if/else branches:
integer=15

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10
else
  echo $integer is not less than 10
fi

# if/elif/else branches:
integer=15

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10
elif [[ $integer -gt 20 ]]
then
  echo $integer is greater than 20
else
  echo $integer is between 10 and 20
fi

# matching 2 conditions using &&:
integer=15

if [[ $integer -gt 10 ]] && [[ $integer -lt 20 ]]
then
  echo $integer is between 10 and 20
fi

# matching 1 of 2 conditions using ||:
integer=7

if ! ([ $integer -eq 5 ]) || ! ([ $integer -eq 6 ])
then
  echo $integer is not 5 or 6
fi
