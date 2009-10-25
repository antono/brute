require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Brute" do
  it "should convert intengers to strings according to some alphabet" do
    0.to_alpha('ab').should == 'a'
    1.to_alpha('ab').should == 'b'
    2.to_alpha('ab').should == 'ba'
    3.to_alpha('ab').should == 'bb'
    4.to_alpha('ab').should == 'baa'
  end

  it "should convert strings to integers according to some alphabet" do
    'a  '.alpha_to_i('ab').should == 0
    ' b '.alpha_to_i('ab').should == 1
    ' ba'.alpha_to_i('ab').should == 2
    'bb '.alpha_to_i('ab').should == 3
    'baa'.alpha_to_i('ab').should == 4
  end

  it "should generate arrays of words of given length of given alphabet" do
    Brute.dict(2,'ab').should  == ['aa','ab','ba','bb']
    Brute.dict(3,'ab').should  == ['aaa','aab','aba','abb','baa','bab','bba', 'bbb']
    Brute.dict(2,'abc').should == ['aa','ab', 'ac', 'ba', 'bb', 'bc', 'ca', 'cb', 'cc']
    Brute.dict(3,'abc').should == [
      'aaa', 'aab', 'aac',
      'aba', 'abb', 'abc',
      'aca', 'acb', 'acc',
      'baa', 'bab', 'bac',
      'bba', 'bbb', 'bbc',
      'bca', 'bcb', 'bcc',
      'caa', 'cab', 'cac',
      'cba', 'cbb', 'cbc',
      'cca', 'ccb', 'ccc'
    ]
    Brute.dict(3, '12').should == [
      '111', '112',
      '121', '122',
      '211', '212',
      '221', '222'
    ]
  end

  it "should return dicts of right length" do
    Brute.dict(2,'ab').uniq.size.should      == 2**2
    Brute.dict(3,'abcdefg').uniq.size.should == 7**3
    Brute.dict(5,'abcdefg').uniq.size.should == 7**5
  end

  it "should not return dupes" do
    Brute.dict(2,'ab').size.should      == Brute.dict(2,'ab').uniq.size
    Brute.dict(3,'abcdefg').size.should == Brute.dict(3,'abcdefg').uniq.size
  end

end
