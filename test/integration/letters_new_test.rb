require 'test_helper'

class LettersNewTest < ActionDispatch::IntegrationTest
  test "letter new" do
  	assert_no_difference 'Letter.count' do
  		post '/letters/', params:{
  			letter:{
  				sender:'me@qq.com', 
  				receiver:'you@qq.com', 
  				content:'你好'
  			}
  		}

  		assert_redirected_to 'new'
  	end
  end
end
