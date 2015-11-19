require 'test_helper'
require 'tar_gz_parser'

class TarGzParserTest < ActiveSupport::TestCase
  test "Empty uri" do
    assert_nil TarGzParser.file_contents('', '') 
  end

  test "Invalid file" do 
    assert_nil TarGzParser.file_contents('this file don\'t exist', '')
  end

  test "Valid file" do
    assert_instance_of(String, TarGzParser.file_contents(Rails.root + 'test/fixtures/A3_1.0.0.tar.gz', 'DESCRIPTION'))
  end 
end
