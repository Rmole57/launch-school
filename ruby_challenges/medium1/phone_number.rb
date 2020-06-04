class PhoneNumber
  INVALID_NUMBER_CODE = '0000000000'

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def number
    return INVALID_NUMBER_CODE unless valid_number?(@phone_number)
    clean_number(@phone_number)
  end

  def area_code
    number[0..2]
  end

  def to_s
    full_num = number
    "(#{full_num[0, 3]}) #{full_num[3, 3]}-#{full_num[6, 4]}"
  end

  private

  def valid_number?(phone_number)
    result = phone_number.gsub(/[^\w]/, '')
    result =~ /^1?\d{10}$/
  end

  def clean_number(phone_number)
    result = phone_number.gsub(/[^\d]/, '')
    result.size == 11 ? result[1..-1] : result
  end
end
