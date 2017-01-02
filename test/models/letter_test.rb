require 'test_helper'

class LetterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@letter = Letter.new(sender:'me@qq.com', receiver:'you@qq.com', content:'hello world', 
  		state:'unsend', authority:'private')
  end

  test "should be valid" do
  	assert @letter.valid?
  end

  test "sender should be present" do 
  	@letter.sender = ''
  	assert_not @letter.valid? 
  end

  test "sender should not be too long" do 
  	@letter.sender = 't'*48 + 't'
  	assert_not @letter.valid? 
  end
end
