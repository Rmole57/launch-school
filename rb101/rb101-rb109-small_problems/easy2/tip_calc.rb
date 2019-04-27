def retrieve_info
  print 'What is the bill? '
  bill = gets.to_f

  print 'What is the tip percentage? '
  percentage = gets.to_f

  [bill, percentage]
end

def calculate_tip(bill, percentage)
  (bill * (percentage / 100)).round(2)
end

def calculate_total(bill, tip)
  bill + tip
end

def display_payment(tip, total)
  puts "The tip is $#{format('%.2f', tip)}"
  puts "The total is $#{format('%.2f', total)}"
end

bill, percentage = retrieve_info

tip = calculate_tip(bill, percentage)
total = calculate_total(tip, bill)

display_payment(tip, total)
