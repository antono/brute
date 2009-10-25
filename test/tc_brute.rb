require 'test/unit'
require 'brute'

class TCBrute < Test::Unit::TestCase

  def test_to_alpha
    assert_equal 'a',    0.to_alpha('ab')
    assert_equal 'b',    1.to_alpha('ab')
    assert_equal 'ba',   2.to_alpha('ab')
    assert_equal 'bb',   3.to_alpha('ab')
    assert_equal 'baa',  4.to_alpha('ab')
  end

  def test_alpha_to_i
    assert_equal 0, 'a'.alpha_to_i('ab')
    assert_equal 1, 'b'.alpha_to_i('ab')
    assert_equal 2, 'ba'.alpha_to_i('ab')
    assert_equal 3, 'bb'.alpha_to_i('ab')
    assert_equal 4, 'baa'.alpha_to_i('ab')
  end

  def test_ab2
    assert_equal ['aa','ab','ba','bb'], Brute.dict(2,'ab')
  end

  def test_ab3
    assert_equal ['aaa','aab','aba','abb','baa','bab','bba', 'bbb'], Brute.dict(3,'ab')
  end

  def test_abc2
    assert_equal ['aa','ab', 'ac', 'ba', 'bb', 'bc', 'ca', 'cb', 'cc'], Brute.dict(2,'abc')
  end

  def test_abc3
    assert_equal [
      'aaa', 'aab', 'aac',
      'aba', 'abb', 'abc',
      'aca', 'acb', 'acc',
      'baa', 'bab', 'bac',
      'bba', 'bbb', 'bbc',
      'bca', 'bcb', 'bcc',
      'caa', 'cab', 'cac',
      'cba', 'cbb', 'cbc',
      'cca', 'ccb', 'ccc'
    ], Brute.dict(3,'abc')
  end

  def test_12_3
    assert_equal [
      '111', '112',
      '121', '122',
      '211', '212',
      '221', '222'
    ], Brute.dict(3, '12')
  end

  def test_brute_words_size
    assert_equal 2**2, Brute.dict(2,'ab').uniq.size
    assert_equal 7**3, Brute.dict(3,'abcdefg').uniq.size
    assert_equal 7**5, Brute.dict(5,'abcdefg').uniq.size
  end

  def test_brute_words_without_dupes
    assert_equal Brute.dict(2,'ab').size, Brute.dict(2,'ab').uniq.size
    assert_equal Brute.dict(3,'abcdefg').size, Brute.dict(3,'abcdefg').uniq.size
  end
end
