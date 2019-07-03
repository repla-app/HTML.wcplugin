#!/System/Library/Frameworks/Ruby.framework/Versions/2.3/usr/bin/ruby

require 'minitest/autorun'
require 'Shellwords'

require_relative '../bundle/bundler/setup'
require 'repla'

require_relative 'lib/test_constants'
require_relative '../lib/controller'

# Test controller
class TestController < Minitest::Test
  def test_controller
    window = Repla::Window.new
    controller = Repla::HTML::Controller.new(TEST_HTML_FILE, window)

    title = window.do_javascript(TEST_TITLE_JAVASCRIPT)
    assert_equal(title, TEST_HTML_TITLE)

    controller.file = TEST_HTML_FILE_TWO
    title_two = window.do_javascript(TEST_TITLE_JAVASCRIPT)
    assert_equal(title_two, TEST_HTML_TITLE_TWO)

    window.close
  end
end
