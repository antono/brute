module Brute
  def dict(word_size, alphabet)
    alphabet = alphabet.split('') unless alphabet.is_a?(Array)
    first = (alphabet[1] + alphabet[0]  * word_size).alpha_to_i(alphabet)
    last  = (alphabet[1] + alphabet[-1] * word_size).alpha_to_i(alphabet)
    (first..last).collect{ |n| n.to_alpha(alphabet)[1..-1] }
  end
  module_function :dict
end

class Fixnum
  def to_alpha(alphabet)
    alphabet = alphabet.split('') unless alphabet.is_a?(Array)
    self.to_s(alphabet.size).split('').collect{ |n| alphabet[n.to_i] }.join
  end
end

class String
  def alpha_to_i(alphabet)
    alphabet = alphabet.split('') unless alphabet.is_a?(Array)
    self.strip.split('').collect { |c| alphabet.index(c) }.join.to_i(alphabet.size)
  end
end
