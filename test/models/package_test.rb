require 'test_helper'

class PackageTest < ActiveSupport::TestCase
  def setup
    @package = Package.new
  end

  def teardown
    @package = nil
  end

  test 'empty package' do
    assert_not @package.save
    assert_equal @package.errors.size, 2
    assert_equal @package.errors.messages[:name].first, 'can\'t be blank'
    assert_equal @package.errors.messages[:version].first, 'can\'t be blank'
  end

  test 'without name' do
    @package.version = '0.0.1'
    assert_not @package.save
    assert_equal @package.errors.size, 1 
    assert_equal @package.errors.messages[:name].first, 'can\'t be blank'
  end

  test 'without version' do
    @package.name = 'A package'
    assert_not @package.save
    assert_equal @package.errors.size, 1 
    assert_equal @package.errors.messages[:version].first, 'can\'t be blank'
  end
end
