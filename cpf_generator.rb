class CPF
  def self.generate
    digits = []
    9.times { digits << rand(9) }
    2.times { digits << self.verification_digit_for(digits) }

    digits.join
  end

  private

  def self.verification_digit_for(known_digits)
    i = 1
    sums = known_digits.reverse.collect do |digit|
      i = i + 1
      digit * i
    end

    verification_digit = 11 - sums.inject(0) { |sum, item| sum + item } % 11
    verification_digit < 10 ? verification_digit : 0
  end
end

puts CPF.generate
