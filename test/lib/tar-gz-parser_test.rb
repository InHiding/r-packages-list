require 'test_helper'
require 'tar-gz-parser'

class TarGzParserTest < ActiveSupport::TestCase
  def setup
    @parser = TarGzParser.new
  end

  def teardown
    @parser = nil
  end

  test "Empty uri" do
    assert_nil @parser.file_contents('', '') 
  end

  test "Invalid file" do 
    assert_nil @parser.file_contents('this file don\'t exist', '')
  end

  test "Valid file" do
    assert_instance_of(String, @parser.file_contents(Rails.root + 'test/fixtures/A3_1.0.0.tar.gz', 'DESCRIPTION'))
  end 
end
