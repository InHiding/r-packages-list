require 'test_helper'
require 'package_metadata_parser'

class PackageMetadataParserTest < ActiveSupport::TestCase
  test ".parse with Empty uri" do
    assert_empty PackageMetadataParser.parse('') 
  end

  test ".parse_zipped with Empty uri" do
    assert_empty PackageMetadataParser.parse_zipped('') 
  end
  
  test ".parse with Invalid file" do 
    assert_empty PackageMetadataParser.parse(Rails.root + 'test/fixtures/empty')
  end

  test ".parse_zipped with Invalid file" do 
    assert_empty PackageMetadataParser.parse(Rails.root + 'test/fixtures/empty')
  end

  test ".parse with Valid file" do
    parsed = PackageMetadataParser.parse(Rails.root + 'test/fixtures/PACKAGES.txt', 10)
    assert_instance_of(Array, parsed)
    assert_equal(parsed.size, 10)
    assert_instance_of(Hash, parsed.first)
    assert_not_empty(parsed.first['Package'])
  end

  test ".parse_zipper with Valid file" do
    parsed = PackageMetadataParser.parse_zipped(Rails.root + 'test/fixtures/A3_1.0.0.tar.gz')
    assert_instance_of(Array, parsed)
    assert_equal(parsed.size, 1)
    assert_instance_of(Hash, parsed.first)
    assert_not_empty(parsed.first['Package'])
  end 
end
