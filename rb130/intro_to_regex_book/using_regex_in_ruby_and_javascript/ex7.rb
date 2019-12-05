def format_date(original_date)
  date_regex =  /
                  \A
                    (?<year>\d{4})
                    (?<separator>-|\/)
                    (?<month>\d{2})
                    \k<separator>
                    (?<day>\d{2})
                  \z
                /x
  original_date.gsub(date_regex, '\k<day>.\k<month>.\k<year>')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2017/05/03') # -> '03.05.2017'
p format_date('2015/01-31') # -> '2015/01-31' (no change)

# ALTERNATIVE SOLUTIONS:

# 1)
# def format_date(original_date)
#   original_date.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
#                .sub(/\A(\d\d\d\d)\/(\d\d)\/(\d\d)\z/, '\3.\2.\1')
# end

# 2)
# def format_date(original_date)
#   date_regex = /\A(\d\d\d\d)([\-\/])(\d\d)\2(\d\d)\z/
#   original_date.sub(date_regex, '\4.\3.\1')
# end
